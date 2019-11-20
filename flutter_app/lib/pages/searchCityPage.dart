import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SearchCityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchCityPageState();
  }
}

class SearchCityPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索城市"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: _loadData,
          child: Text("加载数据"),
        ),
      ),
    );
  }

  void _loadData(){
    getHttp().then((val) {
      setState(() {

      });
    });
  }
}

Future getHttp() async {
  try {
    Response response;
    response = await Dio().get("https://api.xingke.cn/bbs/api/index/citys");
    return response.data;
  } catch (e) {
    return print(e);
  }
}
