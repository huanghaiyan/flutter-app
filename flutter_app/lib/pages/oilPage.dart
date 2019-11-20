import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class OilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("加油"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            print("输入了弹框");
            Fluttertoast.showToast(
              msg: "弹框出现",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 2,
              backgroundColor: Colors.black.withOpacity(0.7),
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          child: Text(
            "弹框",
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 16,
            ),
          ),
          color: Color(0xFFFFDA1C),
        ),
      ),
    );
  }
}
