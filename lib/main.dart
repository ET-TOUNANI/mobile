import 'package:flutter/material.dart';
import 'package:user_github/pages/home.page.dart';
import 'package:user_github/pages/users.page.dart';

void main()=> runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      routes: {
        "/": (context)=>HomePage(),
        "/user":(context)=>UsersPage()
      },
      initialRoute: "/user",
    );
  }
}

