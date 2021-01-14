import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_weixin/widgets/app_bar.dart';
import 'package:flutter_weixin/widgets/bubble.dart';
import 'package:flutter_weixin/widgets/keyboard_dismiss.dart';

class MessageContentPage extends StatefulWidget {
  @override
  _MessageContentPageState createState() => _MessageContentPageState();
}

class _MessageContentPageState extends State<MessageContentPage> {
  ScrollController _myController = ScrollController();

  Map maps = {
    "上午8:23":["第😉😉😉😉\n一次遇\b见W\n是在高\n一下学期的分班","第一眼就有好感[捂脸]","那时候他坐第一排"],
    "上午8:26":["我发誓我只是因为要看黑板所以才看到了他的侧脸！！！！","然后就觉得","妈呀 怎么会有侧脸那么好看的男生！！！！","那时候特别单纯的以为W只是个很腼腆很害羞的男孩子"],
    "上午8:29":["当然我也是个伪高冷","主苏爱情故事"],
  };
  @override
  Widget build(BuildContext context) {
    // here we set the timer to call the event
    jumpTo();
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: LAppBar(
        elevation: 0.5,
        leadingWidth: 120,
        title: new Text('Flutter交流群(499)'),
        leading: InkResponse(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row(
            children: [
              SizedBox(width: 10,),
              Icon(Icons.chevron_left,color: Colors.black,size: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                decoration: BoxDecoration(
                  color: Color(0xffd3d4d5),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth:40
                    ),
                    child: new Text("9999",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis)
                ),
              )
            ],
          ),
        ),
        actions: [
          Icon(Icons.more_horiz)
        ],
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
                  itemBuilder: (BuildContext context,int index, Animation<double> animation){
                    return Column(
                      children: [
                        for(String item in maps.keys)
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20,bottom: 20),
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${item}",
                                      style: TextStyle(color: Color(0xffa8a8a8)),
                                    )

                                  ],
                                ),
                              ),
                              for(String item in maps[item])
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(width: 15),
                                          SizedBox(
                                            width: 44,
                                            height: 44,
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwx1.sinaimg.cn%2Fmw690%2F5301ff11ly1gb58jwjhikj20p00p0q4l.jpg&refer=http%3A%2F%2Fwx1.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612966577&t=bc25f2f0258280b4f76a38d123cbe24e",fit: BoxFit.fill)
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Bubble(
                                            alignment: Alignment.center,
                                            color: Colors.white,
                                            child: ConstrainedBox(
                                              constraints: BoxConstraints(
                                                  maxWidth: MediaQuery.of(context).size.width - 90 - 79
                                              ),
                                              child: Text(
                                                "${item}",
                                                style: TextStyle(color: Colors.black,height: 1.4,fontSize: 16),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),

                                    Container(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Bubble(
                                            direction:BubbleDirection.right,
                                            alignment: Alignment.center,
                                            color: Color(0xff95ec69),
                                            child: ConstrainedBox(
                                              constraints: BoxConstraints(
                                                  maxWidth: MediaQuery.of(context).size.width - 90 - 79
                                              ),
                                              child: Text(
                                                "${item}",
                                                style: TextStyle(color: Colors.black,height: 1.4,fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          SizedBox(
                                            width: 44,
                                            height: 44,
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwx1.sinaimg.cn%2Fmw690%2F5301ff11ly1gb58jwjhikj20p00p0q4l.jpg&refer=http%3A%2F%2Fwx1.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612966577&t=bc25f2f0258280b4f76a38d123cbe24e",fit: BoxFit.fill)
                                            ),
                                          ),
                                          SizedBox(width: 15),

                                        ],
                                      ),
                                    ),

                                    Container(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: 200,
                                              height: 180,
                                              alignment: Alignment.centerRight,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8),
                                                child: Image.network(
                                                  "http://cardata-gudain.oss-cn-beijing.aliyuncs.com/521610588352_.pic.jpg",
                                                  // fit: BoxFit.contain,
                                                ),
                                              )
                                          ),
                                          SizedBox(width: 10),
                                          SizedBox(
                                            width: 44,
                                            height: 44,
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwx1.sinaimg.cn%2Fmw690%2F5301ff11ly1gb58jwjhikj20p00p0q4l.jpg&refer=http%3A%2F%2Fwx1.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612966577&t=bc25f2f0258280b4f76a38d123cbe24e",fit: BoxFit.fill)
                                            ),
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
              child: new Container(
                decoration: new BoxDecoration(color: Color(0xFFF6F6F6)),
                child: Row(
                  children: [
                    Icon(Icons.volume_up),
                    Flexible(
                      child: TextField(
                        onTap: (){
                          jumpTo(animation: true);
                        },
                        onSubmitted: (value){
                         List<String> str =  maps["上午8:29"];
                         str.add(value);
                         setState(() {
                           maps["上午8:29"] = str;
                         });
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.emoji_emotions_outlined),
                        Icon(Icons.add_circle_outline_sharp)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



  void jumpTo({bool animation}){
    if(animation ?? false){
       _myController.animateTo(_myController.position.maxScrollExtent + MediaQuery.of(context).viewInsets.bottom ,duration: Duration(milliseconds: 500,),  curve: Curves.bounceIn);
    }else{
      Timer(Duration(milliseconds: 110), () => _myController.jumpTo(_myController.position.maxScrollExtent));
    }

  }




}
