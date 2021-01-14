import 'package:emoji_picker/emoji_picker.dart';
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
      body: Column(
        children: [
          EmojiPicker(
            rows: 3,
            columns: 7,
            buttonMode: ButtonMode.MATERIAL,
            recommendKeywords: ["racing", "horse"],
            numRecommended: 12,
            onEmojiSelected: (emoji, category) {
              print(emoji);
            },
          )
        ],
      ),
    );
  }
}
