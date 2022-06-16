import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.blueAccent
                      ]
                    )
                  ),
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage:AssetImage("images/github.png") ,
                      radius: 40,
                    ),
                  ),

                ),
                ListTile(
                  title: Text('hi',style: TextStyle(color: Colors.blueAccent,fontSize: 22),),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.arrow_right),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, "/user");
                  },
                ),
                Divider(color: Colors.indigo,height: 2,)
              ],
            )
        );
  }
}
