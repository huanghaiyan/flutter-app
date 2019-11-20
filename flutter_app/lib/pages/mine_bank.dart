import 'package:flutter/material.dart';

class MineBankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的银行卡"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: (){
            print("添加银行卡");
          }),
        ],
      ),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                print("点击了$index");
              },
              child: Container(
                height: 145,
                margin: EdgeInsets.only(left: 10,top: 5, right: 10,bottom: 1),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset("images/bank_bg.png").image,
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                  ),
                ),

                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 15),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 40,
                            child: ClipOval(
                              child: Image.asset("images/bank_logo.png"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: RichText(
                              text: TextSpan(
                                text: "中国银行",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                                children: [
                                  TextSpan(
                                    text: " 信用卡",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left:265,top:50),
                      width: 80,
                      child: Text(
                        "**** 8888",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
