import 'package:flutter/material.dart';
import 'navigator/tabNavigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        // This is the theme of your application.
        //蓝色主题
        primaryColor: Color(0xFFFFD91C),
      ),
      //应用路由
      home: TabNavigator(),
    );
  }
}