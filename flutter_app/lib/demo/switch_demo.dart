import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SwitchDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _isOn ? "😭" : "😁",
                  style: TextStyle(fontSize: 32),
                ),
                Switch(
                  value: _isOn,
                  onChanged: (value) {
                    setState(() {
                      _isOn = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
