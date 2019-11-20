import 'package:flutter/material.dart';

class TourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("景点旅游"),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                print("分享文章");
              }),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(
            "images/travel.png",
            width: MediaQuery.of(context).size.width,
            height: 210,
            fit: BoxFit.cover,
          ),
          addressContainer,
          buttonsContainer,
          textContainer,
        ],
      ),
    );
  }
}

//景点点地址部分
Widget addressContainer = Container(
  padding: const EdgeInsets.all(15),
  child: Row(
    children: <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //顶部对齐
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "北京故宫地址",
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "北京市景山前街4号",
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
      Text(
        "售票时间：08:30--15:50",
        style: TextStyle(
          color: Color(0xFF009688),
          fontSize: 12.0,
        ),
      ),
    ],
  ),
);

Column buildButtonColumn(Image image, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min, //垂直方向上大小最小化
    mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
    children: <Widget>[
      image,
      Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333)),
        ),
      )
    ],
  );
}

//按钮组部分
Widget buttonsContainer = Container(
  //容器横向布局
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround, //水平方向均匀排列每个元素
    children: <Widget>[
      GestureDetector(
        child: buildButtonColumn(Image.asset("images/travel_tel.png"), "电话"),
        onTap: () {
          print("打电话");
        },
      ),
      GestureDetector(
        child: buildButtonColumn(Image.asset("images/travel_navi.png"), "导航"),
        onTap: () {
          print("导航");
        },
      ),
      GestureDetector(
        child: buildButtonColumn(Image.asset("images/travel_share.png"), "分享"),
        onTap: () {
          print("分享");
        },
      ),
    ],
  ),
);

//风景区介绍文本部分
Widget textContainer = Container(
  margin: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0, bottom: 0.0),
//  padding:
//      const EdgeInsets.only(left: 15.0, top: 0.0, right: 15.0, bottom: 0.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "景点简介",
        style: TextStyle(
          color: Color(0xFF333333),
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        textAlign: TextAlign.left,
      ),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Text(
        '''
        多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置，多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置！
多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置！多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置。
多空焦灼！给你一个应对未来的标准配置。
多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置。
       多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置，多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置！
       多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置多空焦灼！给你一个应对未来的标准配置，多空焦灼！
        ''',
        style: TextStyle(color: Color(0xFF333333), fontSize: 14.0),
        softWrap: true,
      ),
    ],
  ),
);
