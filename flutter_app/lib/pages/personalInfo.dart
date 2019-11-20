import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class PersonalInfoPage extends StatelessWidget {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人信息"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: Image.asset("images/viewBg.png").image,
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Container(
          height: 400,
          margin: EdgeInsets.only(left: 15, top: 60, right: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFFE0E0E0),
                  offset: Offset(0.0, 0.0),
                  blurRadius: 10.0,
                  spreadRadius: 2.0)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 10,
                      child: OverflowBox(
                        maxWidth: 80,
                        maxHeight: 80,
                        child: GestureDetector(
                          onTap: () {
                            print("点击了头像");
                          },
                          child: Image.asset("images/default_icon.png"),
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 30,
                      color: Colors.white,
                      margin: EdgeInsets.only(right: 5, top: 10),
                      child: FlatButton(
                        onPressed: () {
                          print("点击了编辑按钮");
                        },
                        child: Text(
                          "编辑",
                          style:
                              TextStyle(color: Color(0xFF333333), fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 60,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "手 机 号：",
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(color: Color(0Xff333333), fontSize: 14),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: controller,
                        maxLines: 1, //最大行数
                        textAlign: TextAlign.right,
                        autofocus: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12), //设置内边距
                          hintText: "请输入你的手机号",
                          hintStyle:
                              TextStyle(color: Color(0xFF999999), fontSize: 14),
//                          border: OutlineInputBorder(//边框
//                            borderSide: BorderSide(width: 0.5),
//                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 20)),
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFE0E0E0),
                height: 10,
                indent: 15,
                endIndent: 15,
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                height: 60,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "昵   称：",
                        textAlign: TextAlign.left,
                        style:
                        TextStyle(color: Color(0Xff333333), fontSize: 14),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: controller,
                        maxLines: 1, //最大行数
                        textAlign: TextAlign.right,
                        autofocus: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12), //设置内边距
                          hintText: "请输入你的昵称",
                          hintStyle:
                          TextStyle(color: Color(0xFF999999), fontSize: 14),
//                          border: OutlineInputBorder(//边框
//                            borderSide: BorderSide(width: 0.5),
//                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 20)),
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFE0E0E0),
                height: 10,
                indent: 15,
                endIndent: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
