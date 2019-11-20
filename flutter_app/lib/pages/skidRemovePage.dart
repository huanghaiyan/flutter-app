import 'package:flutter/material.dart';

class SkidRemovePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SkidRemovePageState();
  }
}

class SkidRemovePageState extends State<SkidRemovePage> {
  //构建30条列表数据
  final List<String> items =
      new List<String>.generate(30, (i) => "列表项${i + 1}");
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("侧滑删除"),
      ),
      body: ListView.builder(
          itemCount: items.length, //指定列表长度
          itemBuilder: (context, index) {
            //构建列表
            //提取出被删除的项
            final item = items[index];
            return new Dismissible(
                key: new Key(item),
                onDismissed: (direction) {
                  if(direction == DismissDirection.endToStart) {
                    //移除指定索引项
                    setState(() {
                      items.removeAt(index);
                    });
                  }
                },

                child: new ListTile(
                  title: new Text("$item"),
                ));
          }),
    );
  }
}
