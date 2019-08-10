import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {

  @override
  _ForumPageState  createState()=>_ForumPageState();
}

class _ForumPageState extends State<ForumPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("车友会"),
      ),
      body: Center(
        child: Text("车友会页面"),
      ),
    );
  }
}