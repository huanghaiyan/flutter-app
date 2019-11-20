import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'mine_bank.dart';
import 'recommend_friend.dart';

class HomePage extends StatelessWidget {
  final List _imageUrls=[
    "http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg",
    "http://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg",
    "http://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: Column(
          children: <Widget>[
            Container(
              height: 160,
              child: Swiper(
                itemCount: _imageUrls.length,
                autoplay: true,
                onTap: (int index){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RecommendFriendPage()),
                  );
                },
                itemBuilder: (BuildContext context, int index){
                  return Image.network(_imageUrls[index],fit:BoxFit.fill);
                },
                //轮播图指示器
                pagination: SwiperPagination(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<Null> _handleRefresh() async{

  return null;
}
