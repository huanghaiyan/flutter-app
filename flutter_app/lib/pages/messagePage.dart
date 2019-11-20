import 'package:flutter/material.dart';
import 'package:flutter_app/model/messageModel.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息列表"),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'loginPage');
            },
            child: Icon(Icons.search,),
          ),
          Padding(padding: const EdgeInsets.only(left: 30.0,right: 20.0),
            child: GestureDetector(
              onTap: (){

              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0),width: 1))),
            child: Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(
                        left: 15, top: 10, right: 15, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    child: Image.network(
                      messageList[index].imageUrl,
                      width: 60,
                      height: 60,
                    )
                ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        messageList[index].messageTitle,
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        messageList[index].messageDesc,
                        style:
                            TextStyle(color: Color(0xFF999999), fontSize: 14),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Text(
                    messageList[index].messageDate,
                    style: TextStyle(color: Color(0xFF666666), fontSize: 14),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: messageList.length,
      ),
    );
  }
}
