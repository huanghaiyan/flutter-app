import 'package:flutter/material.dart';

class CreatePostPage extends StatelessWidget {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("发图文"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              print("点击了发布");
            },
            child: Text("发布",style: TextStyle(color: Color(0xFF333333),fontSize: 18),),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(15),
              child: Theme(
                data: new ThemeData(
                    primaryColor: Color(0xFFEEEEEE),
                    hintColor: Color(0xFF999999)),
                child: TextField(
                  controller: controller,
                  maxLength: 300,
                  maxLines: 10,
                  autofocus: true,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Color(0xFF333333),fontSize: 14.0),
                  decoration: InputDecoration(
                      fillColor: Color(0xFFEEEEEE),
                      filled: true,
                      hintText: "说点什么吧……",
                      hintStyle: TextStyle(color: Color(0xFF999999)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFEEEEEE)),
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  onSubmitted: (text) {
                    print("提交");
                  },
                ),
              )),
          Container(
            margin:
                EdgeInsets.only(left: 15.0, top: 0.0, right: 15.0, bottom: 0.0),
            child: Wrap(
              spacing: 8.0, //主轴（水平）方向间距
              runSpacing: 0.0, //纵轴（垂直）方向间距
              children: <Widget>[
                ActionChip(
                  label: Text("养生之道"),
                  labelStyle: TextStyle(color: Color(0xFF333333)),
                  backgroundColor: Color(0xFFFFDA1C),
                  onPressed: () {
                    print("点击了养生之道");
                  },
                ),
                ActionChip(
                  label: Text("推荐"),
                  labelStyle: TextStyle(color: Color(0xFF333333)),
                  backgroundColor: Color(0xFFFFDA1C),
                  onPressed: () {
                    print("点击了推荐");
                  },
                ),
                ActionChip(
                  label: Text("养生杂谈"),
                  labelStyle: TextStyle(color: Color(0xFF333333)),
                  backgroundColor: Color(0xFFFFDA1C),
                  onPressed: () {
                    print("点击了养生杂谈");
                  },
                ),
                ActionChip(
                  label: Text("关注"),
                  labelStyle: TextStyle(color: Color(0xFF333333)),
                  backgroundColor: Color(0xFFFFDA1C),
                  onPressed: () {
                    print("点击了关注");
                  },
                ),
                ActionChip(
                  label: Text("我性我秀"),
                  labelStyle: TextStyle(color: Color(0xFF333333)),
                  backgroundColor: Color(0xFFFFDA1C),
                  onPressed: () {
                    print("点击了我行我秀");
                  },
                ),
                ActionChip(
                  label: Text("美女车模"),
                  labelStyle: TextStyle(color: Color(0xFF333333)),
                  backgroundColor: Color(0xFFFFDA1C),
                  onPressed: () {
                    print("点击了美女车模");
                  },
                ),
                ActionChip(
                  label: Text("车友会"),
                  labelStyle: TextStyle(color: Color(0xFF333333)),
                  backgroundColor: Color(0xFFFFDA1C),
                  onPressed: () {
                    print("点击了车友会");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
