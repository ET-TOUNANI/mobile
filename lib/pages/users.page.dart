import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_github/pages/repos.page.dart';
class UsersPage extends StatefulWidget {
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  String val =" ";
  bool notVisible = false;
  TextEditingController queryTextEditingController = new TextEditingController();
  dynamic data;
  int currentPage=0;
  int totalPage=0;
  int perPage=20;

  List<dynamic> items =[];
  ScrollController scrollController= ScrollController();
  void _search(String val) {
    String url ='https://api.github.com/search/users?q=${val}&per_page=${perPage}&page=${currentPage}';
    print(url);
    http.get(Uri.parse(url))
        .then((response){
          setState((){

            data= json.decode(response.body);
            items.addAll(data['items']);
            totalPage=(data['total_count']~/perPage).floor()+1;
          });

    })
        .catchError((err){
        print(err);
    });
  }
  void initState(){
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        setState((){
          if(currentPage<totalPage)
             ++currentPage;
          _search(val);
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("user/$val --> $currentPage/$totalPage")),
      body: Center(
        child:Column(
          children: [
             Row(
               children: [
                 Expanded(
                   child: Container(
                       padding: EdgeInsets.all(10),
                       child: TextFormField(
                         obscureText: notVisible,
                         onChanged:(value){
                           setState((){
                             val=value;
                           });
                         },
                         controller: queryTextEditingController,
                         decoration: InputDecoration(
                             suffixIcon: IconButton(
                               onPressed:(){
                                 setState(() {
                                    notVisible=!notVisible;
                                 });
                               },
                               icon: Icon(notVisible==true?Icons.visibility_off:Icons.visibility) ,

                             ),
                             contentPadding: EdgeInsets.all(5),
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(50),
                                 borderSide: BorderSide(
                                     width: 1,color: Colors.indigo
                                 )
                             )
                         ),
                       )
                   ),

                 ),
                 IconButton(
                     onPressed: (){
                       setState((){
                         items=[];
                         currentPage = 0;
                         val = queryTextEditingController.text;
                         _search(val);
                       });
                     },
                     icon: Icon(Icons.search,color: Colors.indigo,)

                 )

               ],
             ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context,index)=> Divider(color: Colors.indigo,height: 2,),
                controller: scrollController,
                  itemCount: items.length ,
                itemBuilder: (context,index){
                    return ListTile(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(
                                builder: (context)=>Repo(login: items[index]['login'],avatar:items[index]['avatar_url'])
                            )
                        );
                      },
                      title: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,

                        children: [

                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(items[index]['avatar_url']),
                                radius: 40,
                              ),
                              SizedBox(width:20),
                              Text("${items[index]['login']}"),
                            ],
                          ),
                          CircleAvatar(
                            child:Text("${items[index]['score']}"),
                          )
                        ],
                      ),
                    );
                },
              ),
            )
          ],
        )
      ),
    );
  }


}