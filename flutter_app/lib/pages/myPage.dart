import 'package:flutter/material.dart';
import 'package:flutter_app/pages/settingPage.dart';

class MyPage extends StatelessWidget {
  List titleList = ["我的钱包","我的爱车","设置"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Center(
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          padding: EdgeInsets.only(left: 10.0),
          separatorBuilder: (BuildContext context, int index) => Divider(height: 1.0, indent:15.0, endIndent:15.0,color: Color(0xFFE0E0E0)),
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              title: Text(titleList[index]), // item 标题
              leading: Icon(Icons.history), // item 前置图标
              trailing: Icon(Icons.keyboard_arrow_right), // item 后置图标
              dense: true,  // item 直观感受是整体大小
              contentPadding: EdgeInsets.all(10.0), // item 内容内边距
              enabled:true,
              onTap: (){// item onTap 点击事件
                print("点击了：$index");
                //导航到新路由
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return SettingPage();
                    }));
              },
              selected:false,     // item 是否选中状态
            );
          },
        ),
      ),
    );
  }
}