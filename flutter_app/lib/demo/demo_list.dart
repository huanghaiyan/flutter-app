import 'package:flutter/material.dart';
import 'package:flutter_app/demo/switch_demo.dart';
import 'package:flutter_app/demo/stepper_demo.dart';
import 'package:flutter_app/demo/bottom_sheet_demo.dart';
import 'package:flutter_app/demo/form_demo.dart';
import 'popup_menu_button_demo.dart';
import 'rich_text_demo.dart';

class DemoListPage extends StatefulWidget {
  @override
  _DemoListPageState createState() => _DemoListPageState();
}

class _DemoListPageState extends State<DemoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DemoList"),
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: "TextField",
            page: TextFieldPage(),
          ),
          ListItem(
            title: "Switch",
            page: SwitchPage(),
          ),
          ListItem(
            title: "PopupMenuButtomDemo",
            page: PopupMenuButtonPage(),
          ),
          ListItem(
            title: "Stepper",
            page: StepperPage(),
          ),
          ListItem(
            title: "BottomSheet",
            page: BottomSheetPage(),
          ),
          ListItem(
            title: "RichText",
            page: RichTextPage(),
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({
    this.title,
    this.page,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => page),
          );
        });
  }
}
