import 'package:flutter/material.dart';
import 'dart:async';

class BottomSheetPage extends StatefulWidget {
  @override
  _BottomSheetPageState createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();
  _openBottomSheet() {
    _bottomSheetScaffoldKey
        .currentState
        .showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              SizedBox(
                width: 16.0,
              ),
              Text("01:30 / 03:30"),
              Expanded(
                child: Text(
                  "Fix you -Coldplay",
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Future _openModalBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("Option A"),
                  onTap: () {
                    Navigator.pop(context, "A");
                    print("点击了Option A");
                  },
                ),
                ListTile(
                  title: Text("Option B"),
                  onTap: () {
                    print("点击了Option B");
                  },
                ),
                ListTile(
                  title: Text("Option C"),
                  onTap: () {
                    print("点击了Option C");
                  },
                ),
              ],
            ),
          );
        });
    print(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("switch"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: _openBottomSheet,
                  child: Text("Open BottomSheet"),
                ),
                FlatButton(
                  onPressed: _openModalBottomSheet,
                  child: Text("Modal BottomSheet"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
