import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'forumDetailPage.dart';

class ForumPage extends StatelessWidget {
  final List _imageUrls = [
    "http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg",
    "http://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg",
    "http://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("车友会"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 160,
              child: Swiper(
                itemCount: _imageUrls.length,
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(_imageUrls[index], fit: BoxFit.fill);
                },
                //轮播图指示器
                pagination: SwiperPagination(),
                onTap: (int index){
                  print("点击轮播图：$index");
                },
              ),
            ),
            Expanded(
//              height: 500.0,
              child: TabbedPage(),
            )
          ],
        ),
      ),
    );
  }
}

class TabbedPage extends StatefulWidget {
  const TabbedPage({Key key}) : super(key: key);
  @override
  _TabbedPageState createState() => _TabbedPageState();
}

class _TabbedPageState extends State<TabbedPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> themeTabs = <Tab>[
    Tab(
      text: "全部",
    ),
    Tab(
      text: "推荐",
    ),
    Tab(
      text: "自驾游",
    ),
    Tab(
      //设置文字
      text: "行车安全",
      //设置图标
//      icon: Icon(Icons.change_history),
    ),
    Tab(
      text: "养车之道",
    ),
    Tab(
      text: "新车谍影",
    ),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: themeTabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new TabBar(
          controller: _tabController,
          //使用Tab类型的数组呈现Tab标签
          tabs: themeTabs,
          //指示器的颜色
          indicatorColor: Color(0xFFFFD91C),
          //指示器的宽度，和label一样
          indicatorSize: TabBarIndicatorSize.label,
          //指示器的高度
          indicatorWeight: 3,
          isScrollable: true,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: themeTabs.map((Tab tab) {
          //遍历List<Tab>类型的对象myTabs并提取其属性值作为子控件的内容
          return ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.white,
                  height: 240.0,
                  margin: EdgeInsets.all(5.0),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ForumDetailPage();
                            }));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10.0,right: 10.0),
                            height: 210,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "我是标题",
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    height: 180,
                                    child: Image.asset("images/car_1.png",
                                        width:
                                            MediaQuery.of(context).size.width-30,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                );
              });
        }).toList(),
      ),
    );
  }
}
