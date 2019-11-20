import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'loginPage.dart';

class MinePage extends StatelessWidget {
  final int isLogin = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: isLogin==1?ListView(
        children: <Widget>[
          _topHeader(),
          _orderTitle(),
          _orderType(),
          _actionList(),
        ],
      ):ListView(
        children: <Widget>[
          _loginView(context),
        ],
      ),
    );
  }

  //我的头部
  Widget _topHeader() {
    return Container(
      width: 375,
      height: 200,
      padding: EdgeInsets.all(20),
      color: Color(0xFFFFD91C),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            width: 60,
            height: 60,
            child: ClipOval(
              child: Image.network(
                  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3146277763,293920617&fm=111&gp=0.jpg"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "技术胖",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  //我的订单
  Widget _orderTitle() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
//      decoration: BoxDecoration(
//        color: Colors.white,
//        border: Border(
//          bottom: BorderSide(width: 1, color: Colors.black12),
//        ),
//      ),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text("我的订单"),
//        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _orderType() {
    return Container(
      margin: EdgeInsets.only(top: 0),
      width: 375,
      height: 90,
      padding: EdgeInsets.only(top: 15),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 93,
            child: Column(
              children: <Widget>[
                Image.asset("images/mine_bank.png"),
                Text("我的银行卡"),
              ],
            ),
          ),
          Container(
            width: 93,
            child: Column(
              children: <Widget>[
                Image.asset("images/dopay.png"),
                Text("DoPay余额"),
              ],
            ),
          ),
          Container(
            width: 93,
            child: Column(
              children: <Widget>[
                Image.asset("images/charge.png"),
                Text("充值"),
              ],
            ),
          ),
          Container(
            width: 93,
            child: Column(
              children: <Widget>[
                Image.asset("images/mine_order.png"),
                Text("我的订单"),
              ],
            ),
          ),
        ],
      ),
    );
  }

//我的列表
  Widget _myListTitle(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: ListTile(
        leading: Icon(Icons.blur_circular),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _actionList() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _myListTitle("领取优惠券"),
          _myListTitle("地址管理"),
          _myListTitle("客服电话"),
        ],
      ),
    );
  }

  Widget _loginView(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 95, top: 220, right: 95),
            child: Image.asset("images/empty.png"),
          ),
          Container(
            child: RichText(
              text: TextSpan(
                text: "登录",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 16.0,
                ),
                children: [
                  TextSpan(
                    text: "后可查看我的页面哦~",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, top: 40, right: 50),
            width: 280,
            height: 48,
            child: FlatButton(
                onPressed: () {
                  print("去登录");
                  login(context);
                },
                child: Text(
                  "登  录",
                  style: TextStyle(color: Color(0xFF333333), fontSize: 18),
                ),
              color: Color(0xFFFFDA1C),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black.withOpacity(0.75),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void login(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
