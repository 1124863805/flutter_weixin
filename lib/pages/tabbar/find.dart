import 'package:flutter/material.dart';
import 'package:flutter_weixin/widgets/common_widgets.dart';


// 发现页面
class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppBar(
        actions: [
          Icon(Icons.person_add)
        ],
        title: new Text("发现"),
      ),
    );
  }
}
