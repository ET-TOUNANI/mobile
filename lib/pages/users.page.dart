import 'package:flutter/material.dart';
class UsersPage extends StatefulWidget {
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  String val =" ";
  TextEditingController queryTextEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("user/$val")),
      body: Center(
        child:Column(
          children: [
             Row(
               children: [
                 Expanded(
                   child: Container(
                       padding: EdgeInsets.all(10),
                       child: TextFormField(
                         onChanged:(value){
                           setState((){
                             val=value;
                           });
                         },
                         controller: queryTextEditingController,
                         decoration: InputDecoration(
                             suffixIcon: Icon(Icons.visibility),
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
                         val = queryTextEditingController.text;
                       });
                     },
                     icon: Icon(Icons.search,color: Colors.indigo,)

                 )

               ],
             )
          ],
        )
      ),
    );
  }
}