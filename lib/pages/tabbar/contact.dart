import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weixin/widgets/common_widgets.dart';

// 联系人页面
class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppBar(
        actions: [
          Icon(Icons.person_add)
        ],
        title: new Text("通讯录"),
      ),
      body: Column(
        children: [



        ],
      ),
    );
  }
}
