import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldPage> {
  final nameController = TextEditingController();
  //销毁资源
  void dispose(){
    nameController.dispose();
    super.dispose();
  }

  //初始数据
  void initState(){
    super.initState();
    nameController.text = "hi";
    nameController.addListener((){
      debugPrint("input:${nameController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16.0),
            child: TextField(
              controller: nameController,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "请输入姓名",
//              border: InputBorder.none,
                border: OutlineInputBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
