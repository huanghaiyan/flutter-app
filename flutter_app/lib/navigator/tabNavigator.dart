import 'package:flutter/material.dart';
import 'package:flutter_app/pages/homePage.dart';
import 'package:flutter_app/pages/myPage.dart';
import 'package:flutter_app/pages/oilPage.dart';
import 'package:flutter_app/pages/forumPage.dart';

class TabNavigator extends StatefulWidget{
  //_TabNavigatorState定义好后，就可以修改该函数的返回值进行返回
  @override
  _TabNavigatorState  createState()=>_TabNavigatorState();
}

//在dart里面，如果要定义一个内部类，不能被外部访问的话，就可以以下划线开头
class _TabNavigatorState extends State<TabNavigator>{
  final _defaultColor = Color(0xFF333333);
  final _selectedColor = Color(0xFF333333);
  int _selectedIndex = 0;

  final PageController _controller = PageController(
    //初始状态下打开第0个tab
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context){
    //在build（）方法里面，可以将Scaffold（）作为整个页面的根节点
    return Scaffold(
      //body中定义一个PageView
      body: PageView(
        //pageview中使用一个controller
        controller: _controller,
        //禁用滚动事件
//        physics: NeverScrollableScrollPhysics(),
        //处理页面切换时选中的页面
        onPageChanged:(index){
          _controller.jumpToPage(index);
          setState(() {
            _selectedIndex=index;
          });
        } ,
        //要显示的页面
        //需要显示“首页”、“加油”、“车友会”、“我的”
        children: <Widget>[
          HomePage(),
          OilPage(),
          ForumPage(),
          MyPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            _controller.jumpToPage(index);
            setState(() {
              _selectedIndex=index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon:Image.asset("images/tabbar_home.png"),
              activeIcon: Image.asset("images/tabbar_home_sel.png"),
              title: Text(
                "首页",
                style: TextStyle(color: _selectedIndex!=0?_defaultColor:_selectedColor)
              ),
            ),
            BottomNavigationBarItem(
              icon:Image.asset("images/tabbar_oil.png"),
              activeIcon: Image.asset("images/tabbar_oil_sel.png"),
              title: Text(
                  "加油",
                  style: TextStyle(color: _selectedIndex!=1?_defaultColor:_selectedColor)
              ),
            ),
            BottomNavigationBarItem(
              icon:Image.asset("images/tabbar_forum.png"),
              activeIcon: Image.asset("images/tabbar_forum_sel.png"),
              title: Text(
                  "车友会",
                  style: TextStyle(color: _selectedIndex!=2?_defaultColor:_selectedColor)
              ),
            ),
            BottomNavigationBarItem(
              icon:Image.asset("images/tabbar_me.png"),
              activeIcon: Image.asset("images/tabbar_me_sel.png"),
              title: Text(
                  "我的",
                  style: TextStyle(color: _selectedIndex!=3?_defaultColor:_selectedColor)
              ),
            ),
          ]
      ),
    );
  }
}