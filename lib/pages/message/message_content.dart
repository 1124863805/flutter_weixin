import 'dart:async';
import 'dart:io';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_weixin/widgets/app_bar.dart';
import 'package:flutter_weixin/widgets/bubble.dart';
import 'package:flutter_weixin/widgets/keyboard_dismiss.dart';
import 'package:emoji_picker/emoji_lists.dart' as emojiList;

class MessageContentPage extends StatefulWidget {
  @override
  _MessageContentPageState createState() => _MessageContentPageState();
}

class _MessageContentPageState extends State<MessageContentPage>
    with SingleTickerProviderStateMixin {
  ScrollController _myController = ScrollController();
  FocusNode _focusNode = FocusNode();

  Map maps = {
    "上午8:23": ["第😉😉😉😉\n一次遇\b见W\n是在高\n一下学期的分班", "第一眼就有好感[捂脸]", "那时候他坐第一排"],
    "上午8:26": [
      "我发誓我只是因为要看黑板所以才看到了他的侧脸！！！！",
      "然后就觉得",
      "妈呀 怎么会有侧脸那么好看的男生！！！！",
      "那时候特别单纯的以为W只是个很腼腆很害羞的男孩子"
    ],
    "上午8:29": ["当然我也是个伪高冷", "主苏爱情故事"],
  };

  bool showExpression = false; // 默认不显示表情
  TabController _tabController;

  //监听得放在初始化中
  @override
  void initState() {
    super.initState();
    getEmojinList();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    //输入框焦点
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
      } else {
        // 得到焦点
        setState(() {
          showExpression = false;
        });
      }
    });


    WidgetsBinding.instance.addPostFrameCallback((_) {
      _myController.jumpTo(_myController.position.maxScrollExtent);
    });
  }

  Map<String, String> smileyMap = new Map();
  List<String> allNames = new List();
  List<String> allEmojis = new List();

  getEmojinList() async {
    smileyMap = await getAvailableEmojis(emojiList.smileys);
    allNames.addAll(smileyMap.keys);
    allEmojis.addAll(smileyMap.values);
    setState(() {});
  }

//离开页面记着销毁和清除
  @override
  void dispose() {
    _focusNode.unfocus();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: LAppBar(
        elevation: 0.5,
        leadingWidth: 120,
        title: new Text('Flutter交流群(499)'),
        leading: InkResponse(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(Icons.chevron_left, color: Colors.black, size: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                    color: Color(0xffd3d4d5),
                    borderRadius: BorderRadius.circular(10)),
                child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 40),
                    child: new Text("9999",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis)),
              )
            ],
          ),
        ),
        actions: [Icon(Icons.more_horiz)],
      ),
      body: KeyboardDismiss(
        child: Column(
          children: [
            Flexible(
              child: Container(
                color: Color(0xffededed),
                child: AnimatedList(
                  controller: _myController,
                  initialItemCount: 1,
                  itemBuilder: (BuildContext context, int index,
                      Animation<double> animation) {
                    return Column(
                      children: [
                        for (String item in maps.keys)
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20, bottom: 20),
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${item}",
                                      style:
                                          TextStyle(color: Color(0xffa8a8a8)),
                                    )
                                  ],
                                ),
                              ),
                              for (String item in maps[item])
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(width: 15),
                                          SizedBox(
                                            width: 44,
                                            height: 44,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwx1.sinaimg.cn%2Fmw690%2F5301ff11ly1gb58jwjhikj20p00p0q4l.jpg&refer=http%3A%2F%2Fwx1.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612966577&t=bc25f2f0258280b4f76a38d123cbe24e",
                                                    fit: BoxFit.fill)),
                                          ),
                                          SizedBox(width: 10),
                                          Bubble(
                                            alignment: Alignment.center,
                                            color: Colors.white,
                                            child: ConstrainedBox(
                                              constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          90 -
                                                          79),
                                              child: Text(
                                                "${item}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    height: 1.4,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Bubble(
                                            direction: BubbleDirection.right,
                                            alignment: Alignment.center,
                                            color: Color(0xff95ec69),
                                            child: ConstrainedBox(
                                              constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          90 -
                                                          79),
                                              child: Text(
                                                "${item}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    height: 1.4,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          SizedBox(
                                            width: 44,
                                            height: 44,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwx1.sinaimg.cn%2Fmw690%2F5301ff11ly1gb58jwjhikj20p00p0q4l.jpg&refer=http%3A%2F%2Fwx1.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612966577&t=bc25f2f0258280b4f76a38d123cbe24e",
                                                    fit: BoxFit.fill)),
                                          ),
                                          SizedBox(width: 15),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: 200,
                                              height: 180,
                                              alignment: Alignment.centerRight,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  "http://cardata-gudain.oss-cn-beijing.aliyuncs.com/521610588352_.pic.jpg",
                                                  // fit: BoxFit.contain,
                                                ),
                                              )),
                                          SizedBox(width: 10),
                                          SizedBox(
                                            width: 44,
                                            height: 44,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwx1.sinaimg.cn%2Fmw690%2F5301ff11ly1gb58jwjhikj20p00p0q4l.jpg&refer=http%3A%2F%2Fwx1.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612966577&t=bc25f2f0258280b4f76a38d123cbe24e",
                                                    fit: BoxFit.fill)),
                                          ),
                                          SizedBox(width: 15),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                            ],
                          )
                      ],
                    );
                  },
                ),
              ),
            ),
            new Divider(height: 1.0),
            SafeArea(
              child: Column(
                children: [
                  new Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: new BoxDecoration(color: Color(0xFFF6F6F6)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.volume_up,
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 37,
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7)),
                            child: TextField(
                              focusNode: _focusNode,
                              cursorColor: Color(0xff00c15e),
                              onTap: () {
                                jumpTo();
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                              ),
                              onSubmitted: (value) {
                                List<String> str = maps["上午8:29"];
                                str.add(value);
                                setState(() {
                                  maps["上午8:29"] = str;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Row(
                          children: [
                            InkResponse(
                                onTap: () {
                                  _focusNode.unfocus();
                                  setState(() {
                                    showExpression = !showExpression;
                                  });
                                },
                                child:
                                    Icon(Icons.emoji_emotions_outlined, size: 30)),
                            SizedBox(width: 10),
                            Icon(Icons.add_circle_outline_sharp, size: 30)
                          ],
                        )
                      ],
                    ),
                  ),

                  Offstage(
                    offstage: !showExpression,
                    child: Container(
                      height: 350,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 50,
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 20,right: 10),
                                    child: Icon(Icons.search_sharp)
                                ),
                                TabBar(
                                  isScrollable:true,
                                  controller: _tabController,
                                  indicator: CircleTabIndicator(color: Colors.white, radius: 10),
                                  tabs: [
                                    Icon(Icons.emoji_emotions_outlined,color: Colors.black,),
                                    Icon(Icons.add_circle_outline,color: Colors.black)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: <Widget>[
                                  Stack(
                                    children: [
                                      ListView(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 20),
                                              child: new Text("最近使用")
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            margin: EdgeInsets.symmetric(horizontal: 20),
                                            child: GridView.builder(
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 8,
                                                    childAspectRatio: 0.6,
                                                    crossAxisSpacing: 20
                                                ),
                                                itemCount: 8,
                                                itemBuilder: (BuildContext context,int index){
                                                  return new Text("${allEmojis[index]}",style: TextStyle(fontSize: 27),);
                                                }
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(left: 20),
                                              child: new Text("所有表情")
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            margin: EdgeInsets.symmetric(horizontal: 20),
                                            child: GridView.builder(
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 8,
                                                  childAspectRatio: 0.6,
                                                  crossAxisSpacing: 20
                                                ),
                                              itemCount: allEmojis.length,
                                                itemBuilder: (BuildContext context,int index){
                                                  return new Text("${allEmojis[index]}",style: TextStyle(fontSize: 27),);
                                                }
                                             ),
                                          ),
                                        ],
                                      ),

                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          width: 160,
                                          height: 80,
                                          child: Column(
                                            children: [
                                              Container(width: 160,height: 20,color: Color(0xFFF6F6F6).withOpacity(0.9)),
                                              Container(
                                              color: Color(0xFFF6F6F6),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 65,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10)
                                                      ),
                                                      child: Icon(Icons.backspace_outlined),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    Container(
                                                      alignment: Alignment.center,
                                                      width: 65,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xff04c160),
                                                          borderRadius: BorderRadius.circular(10)
                                                      ),
                                                      child: new Text("发送",style: TextStyle(color: Colors.white,fontSize: 20)),
                                                    ),
                                                  ],
                                                ),
                                              ),Expanded(child: Container(
                                                color: Color(0xFFF6F6F6),
                                              ))
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Center(
                                    child: Icon(Icons.directions_transit),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );


  }

  Future<Map<String, String>> getAvailableEmojis(
      Map<String, String> map) async {
    Map<String, String> newMap = Map<String, String>();

    for (String key in map.keys) {
      bool isAvailable = await _isEmojiAvailable(map[key]);
      if (isAvailable) {
        newMap[key] = map[key];
      }
    }

    return newMap;
  }
  static const platform = const MethodChannel("emoji_picker");
  Future<bool> _isEmojiAvailable(String emoji) async {
    if (Platform.isAndroid) {
      bool isAvailable;
      try {
        isAvailable =
        await platform.invokeMethod("isAvailable", {"emoji": emoji});
      } on PlatformException catch (_) {
        isAvailable = false;
      }
      return isAvailable;
    } else {
      return true;
    }
  }

  void jumpTo() {
    if (MediaQuery.of(context).viewInsets.bottom == 0) { //当前没有显示键盘
      Future.delayed(Duration(milliseconds: 100), () {
        print("----${MediaQuery.of(context).viewInsets.bottom}");
        _myController.animateTo(
            _myController.position.maxScrollExtent +
                MediaQuery.of(context).viewInsets.bottom,
            duration: Duration(
              milliseconds: 10,
            ),
            curve: SawTooth(1));
      });
    } else {
      if (_myController.offset != _myController.position.maxScrollExtent) {
        Future.delayed(Duration(milliseconds: 100), () {
          print("----${MediaQuery.of(context).viewInsets.bottom}");
          _myController.animateTo(
              _myController.position.maxScrollExtent +
                  MediaQuery.of(context).viewInsets.bottom,
              duration: Duration(
                milliseconds: 10,
              ),
              curve: SawTooth(1));
        });
      }
    }
  }
}


// 自定义Tabbar 指示器
class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
    ..color = color
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Offset circleOffset = offset + Offset((configuration.size.width - 40) /2, configuration.size.height - radius - 25);
    canvas.drawRRect(RRect.fromRectAndRadius(circleOffset & const Size(40, 40), Radius.circular(4)), _paint);
  }
}
