import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/model/userInfoModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();
  final verifyCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset("images/login_bg.png").image,
                fit: BoxFit.fill),
          ),
          child: Column(
            children: <Widget>[
              logoImageContainer,
              Container(
                margin: EdgeInsets.only(left: 30, top: 50, right: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Theme(
                              data: new ThemeData(
                                primaryColor:
                                    Colors.redAccent.withOpacity(0.75),
                                hintColor: Colors.black.withOpacity(0.75),
                              ),
                              child: TextField(
                                controller: phoneController,
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.0),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  fillColor: Color(0xFFFFF6C6),
                                  filled: true,
                                  hintText: "请输入您的手机号",
                                  hintStyle:
                                      TextStyle(color: Color(0xFF999999)),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.75),
                                        width: 0.2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 110,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.75),
                                  width: 0.5,
                                  style: BorderStyle.solid),
                            ),
                            child: FlatButton(
                              onPressed: () {
                                print("点击了获取验证码");
                                sendVerifyCode();
                              },
                              child: Text(
                                "获取验证码",
                                style: TextStyle(
                                    color: Color(0xFF333333), fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 0, top: 15, right: 0),
                      child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.redAccent.withOpacity(0.75),
                          hintColor: Colors.black.withOpacity(0.75),
                        ),
                        child: TextField(
                          controller: verifyCodeController,
//                        keyboardType: TextInputType.number,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 14.0),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            fillColor: Color(0xFFFFF6C6),
                            filled: true,
                            hintText: "请输入您的验证码",
                            hintStyle: TextStyle(color: Color(0xFF999999)),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 0.2),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 40, right: 30),
                      width: MediaQuery.of(context).size.width - 140,
                      height: 48,
                      child: FlatButton(
                        onPressed: () {
                          print("点击了登录");
                          login();
                        },
                        child: Text(
                          "登     录",
                          style:
                              TextStyle(color: Color(0xFF333333), fontSize: 18),
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
              )
            ],
          ),
        ),
      ),
    );
  }

  void sendVerifyCode() async {
    if (phoneController.text.toString() == '') {
      Fluttertoast.showToast(
        msg: "请输入手机号",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );

//      showDialog(context: context,
//        builder: (context) => AlertDialog(title: Text("请输入手机号")),
//      );
      return;
    }
    if (phoneController.text.length != 11) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text("请输入正确的手机号")),
      );
      return;
    }
    Dio dio = new Dio();
    Response response;
    response = await dio.post(
        "https://api.xingke.cn/api/publicservice/sendSmsMsg",
        data: {"phoneNum": phoneController.text});
    print(response.data);
  }

  void login() async {
    if (phoneController.text.toString() == '') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text("请输入手机号")),
      );
      return;
    }
    if (phoneController.text.length != 11) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text("请输入正确的手机号")),
      );
      return;
    }
    if (verifyCodeController.text.toString() == '') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text("请输入验证码")),
      );
      return;
    }
    Dio dio = new Dio();
    Response response;
    response = await dio.post("https://api.xingke.cn//api/mobileuser/fastLogin",
        data: {
          "phoneNum": phoneController.text,
          "smsCode": verifyCodeController.text
        });
    print(response.data);
    UserInfoModel infoModel = UserInfoModel.fromJson(response.data["data"]);
    print(infoModel.nickName);
  }
}

Widget logoImageContainer = Container(
  margin: EdgeInsets.only(top: 150),
  width: 113,
  height: 93,
  child: Image.asset("images/xk_logo.png"),
);

