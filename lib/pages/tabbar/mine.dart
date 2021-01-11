import 'package:flutter/material.dart';
import 'package:flutter_weixin/widgets/app_bar.dart';


// 个人中心
class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppBar(
        actions: [
          Icon(Icons.person_add)
        ],
      ),
    );
  }
}
