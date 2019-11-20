import 'package:flutter/material.dart';

class PopupMenuButtonPage extends StatefulWidget {
  @override
  _PopupMenuButtonPageState createState() => _PopupMenuButtonPageState();
}

class _PopupMenuButtonPageState extends State<PopupMenuButtonPage> {
  String _currentMenuItem = "Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopupMenuButtonDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_currentMenuItem),
                PopupMenuButton(
                  onSelected: (value) {
                    print(value);
                    setState(() {
                      _currentMenuItem = value;
                    });
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      child: Text("Home"),
                      value: "Home",
                    ),
                    PopupMenuItem(
                      child: Text("Discover"),
                      value: "Discover",
                    ),
                    PopupMenuItem(
                      child: Text("Me"),
                      value: "Me",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
