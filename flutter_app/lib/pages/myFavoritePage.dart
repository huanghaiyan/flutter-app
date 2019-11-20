import 'package:flutter/material.dart';
import 'package:flutter_app/model/myFavoriteModel.dart';
class MyFavoritePage extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(//竖直排列
        children: <Widget>[
          //加载网络图片
          Image.network(myFavorites[index].imageUrl),
          SizedBox(height: 16.0,),
          Text(
            myFavorites[index].title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          Text(
            myFavorites[index].author,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 16.0,),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("我的收藏"),
      ),
      body: ListView.builder(
        itemCount: myFavorites.length,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}

