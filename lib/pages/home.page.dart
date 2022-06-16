import 'package:flutter/material.dart';
import 'package:user_github/widget/drawer.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: MyDrawer(),
      body: Center(
        child: Text('home',style: Theme.of(context).textTheme.headline3,),
      ),
    );
  }
}