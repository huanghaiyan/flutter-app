import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/model/myFansModel.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class MyFansPage extends StatefulWidget {
  final String appBarTitle;
  MyFansPage({Key key, @required this.appBarTitle}) : super(key: key);
  @override
  MyFansPageState createState() => MyFansPageState();
}

class MyFansPageState extends State<MyFansPage> {
  EasyRefreshController _controller;

  var fansModel = MyFansModel();
  int _pageNum = 1;
  List _dataList = List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFansData();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    GlobalKey _easyRefreshKey = GlobalKey();
    GlobalKey _headerKey = GlobalKey();
    GlobalKey _footerKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      body: Container(
        child: EasyRefresh(
          controller: _controller,
          key: _easyRefreshKey,
          header: ClassicalHeader(
            key: _headerKey,
            refreshText: "下拉刷新",
            refreshReadyText: "松开刷新...",
            refreshingText: "正在刷新...",
            refreshedText: "刷新结束",
            textColor: Colors.black87,
          ),
          footer: ClassicalFooter(
            key: _footerKey,
            loadText: "加载更多",
            loadReadyText: "正在加载中...",
            loadingText: "正在加载中...",
            loadedText: "加载完成",
            noMoreText: "没有更多了",
            textColor: Colors.black87,
          ),
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1), () {
              setState(() {
                _pageNum = 1;
              });
              getFansData();
              _controller.resetLoadState();
            });
          },
          onLoad: () async {
            await Future.delayed(const Duration(seconds: 1), () {
              setState(() {
                _pageNum += 1;
              });
              getFansData();
            });
          },
          child: ListView.builder(
            itemCount: _dataList != null ? _dataList.length : 0,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                height: 130,
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset("images/focusBg.png").image,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: GestureDetector(
                        onTap: () {
                          print("点击了头像");
                        },
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            child: Image.network(
                              _dataList[index].userAvatar,
                              width: 60,
                              height: 60,
                            )),
                      ),
                    ),
                    Text(
                      "${_dataList[index].nickName}",
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                          padding: EdgeInsets.only(right: 20.0),
                          alignment: Alignment.centerRight,
                          splashColor: Colors.white, //按钮波纹颜色
                          iconSize: 70,
                          icon: Image.asset(
                            "images/focusOn.png",
                            width: 70,
                            height: 20,
                          ),
                          onPressed: () {
                            print("点击了关注按钮：$index");
                            focusOtherPerson(index, _dataList[index].attentionFlag);
                          }),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset("images/viewBg.png").image,
            fit: BoxFit.fitWidth,
            alignment: Alignment.topLeft,
          ),
//          Image.asset("images/viewBg.png",width: MediaQuery.of(context).size.width,fit: BoxFit.fill),
        ),
      ),
    );
  }

  void getFansData() async {
    //请求我的关注接口
    try {
      String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMDAwMDk3MSJ9.3dKBd4-ijIvieX05RjI6frtKzJoepmq29Z7zecUJWIM";
      Dio dio = new Dio();
      dio.options.headers["token"] = token;
      Response response = await dio.post(
          "https://api.xingke.cn/bbs/api/user/getUserAttentionListByUserId",
          data: {
            "pageNum": _pageNum.toString(),
            "pageSize": "10",
            "queryUserId": "10000971",
            "userId": "10000971"
          });
      print(response.data["data"]);
      Map fansModelMap = response.data["data"];
      fansModel = MyFansModel.fromJson(fansModelMap);
      setState(() {
        if (fansModel.list.length != 0) {
          if (_pageNum == 1) {
            _dataList.clear();
            _dataList.addAll(fansModel.list);
          } else {
            _dataList.addAll(fansModel.list);
          }
        } else {
          if (_pageNum == 1) {
            _dataList.clear();
          } else {
            _controller.finishLoad(noMore: true);
          }
        }
      });
    } catch (e) {
      print("请求失败:$e");
    } finally {}
  }

  void focusOtherPerson(int index, int isFocus) async {
    try {
      String typeStr = "0";
      if (isFocus == 1) {
        typeStr = "1";
      }

      MyFansItemModel itemModel = _dataList[index];

      String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMDAwMDk3MSJ9.3dKBd4-ijIvieX05RjI6frtKzJoepmq29Z7zecUJWIM";
      Dio dio = new Dio();
      dio.options.headers["token"] = token;

      Response response = await dio.post(
          "https://api.xingke.cn/bbs/api/userAttention/attention",
          data: {
            "userId": "10000971",
            "attentionUserId": itemModel.userId,
            "type": typeStr
          });
      print(response.data);
      if(response.data["code"] == 200){
        _dataList.remove(itemModel);
      }
      setState(() {

      });
    } catch (e) {} finally {}
  }
}
