import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/model/integralModel.dart';

class RecommendFriendPage extends StatefulWidget {
  @override
  _RecommendFriendPageState createState() => _RecommendFriendPageState();
}

class _RecommendFriendPageState extends State<RecommendFriendPage> {
  var _intergralModel = IntegralModel("0","");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestInviteQueryData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("推荐好友"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset("images/recommend_bg.png").image,
              fit: BoxFit.fitHeight),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 0, top: 50, right: 0),
              child: Image(
                image: Image.asset("images/recommend_bg2.png").image,
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              width: 340,
              height: 520,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset("images/recommend_bg3.png").image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 60, top: 50, right: 60),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "邀请好友加入行客\n可获得",
                        style: TextStyle(
                          color: Color(0xFFF7364C),
                          fontSize: 26.0,
                        ),
                        children: [
                          TextSpan(
                            text: _intergralModel.integral,
                            style: TextStyle(
                                color: Color(0xFFF7364C),
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "积分",
                            style: TextStyle(
                              color: Color(0xFFF7364C),
                              fontSize: 26.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text("你的邀请码"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 220,
                    child: Text(
                      _intergralModel.inviteCode,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 36.0,
                      ),
                    ),
                  ),
                  FlatButton(
                    color: Color(0xFFFFE100),
                    onPressed: () {
                      print("点击了复制按钮");
                      //复制粘贴
//                      ClipboardData data = new ClipboardData(text: "12434");//_intergralModel.inviteCode
//                      Clipboard.setData(data);
                      //延时1s执行
//                      Future.delayed(Duration(seconds: 1),(){
                        Fluttertoast.showToast(
                            msg: "复制成功",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIos: 3,
                            backgroundColor: Colors.black.withOpacity(0.7),
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
//                      });
                    },
                    child: Text(
                      "复制",
                      style: TextStyle(
                        color: Color(0xFF333333),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0xFFFFE100),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void requestInviteQueryData() async{
    try{
      String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMDAwMDk3MSJ9.3dKBd4-ijIvieX05RjI6frtKzJoepmq29Z7zecUJWIM";
      Dio dio = new Dio();
      dio.options.headers["token"] = token;
      Response response = await dio.get("https://api.xingke.cn/bbs/api/user/genInviteCode");

      print("respone data ${response.data}");

      if(response.data["code"] == 200){
        print("请求成功");
        Map integralMap = response.data["data"];
        _intergralModel = IntegralModel.fromJson(integralMap);
      }
      setState(() {

      });
    }catch(e){

    }
  }
}
