import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
class Repo extends StatefulWidget {
  String login;
  String avatar;
  dynamic dataRepo;
  Repo( {required this.login , required this.avatar});

  @override
  State<Repo> createState() => _RepoState();
}

class _RepoState extends State<Repo> {
  void initState(){
    super.initState();
    loadRepo();
  }
  void loadRepo(){
    String url ='https://api.github.com/users/${widget.login}/repos';
    http.get(Uri.parse(url))
        .then((value) => setState((){
            widget.dataRepo=json.decode(value.body);
        }) )
        .catchError((err){
          print(err);
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Repo de ${widget.login}"),
          actions: [
            CircleAvatar(backgroundImage: NetworkImage(widget.avatar),)
          ],
        ),
        body: Center(
          child: ListView.separated(
              itemBuilder:(context,index)=> ListTile(
                title: Text("${widget.dataRepo[index]['name']}",)
              ),
              separatorBuilder: (context,index)=> Divider(color: Colors.indigo,height: 2,),
              itemCount: (widget.dataRepo==null)?0: widget.dataRepo.length
          )
        ),
    );
  }
}

