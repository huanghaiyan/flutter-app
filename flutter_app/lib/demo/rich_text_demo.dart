import 'package:flutter/material.dart';

class RichTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RichText"),
      ),
      body: Container(
        color: Colors.white,
        child: RichText(
          text: TextSpan(
            text: "hell world",
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 34.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w100,
            ),
            children: [
              TextSpan(
                text: ".net",
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.grey,
                ),
              ),
              TextSpan(
                text: ".fft",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
