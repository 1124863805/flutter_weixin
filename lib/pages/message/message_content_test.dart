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

class MessageContentTest extends StatefulWidget {
  @override
  _MessageContentTestState createState() => _MessageContentTestState();
}

class _MessageContentTestState extends State<MessageContentTest> {


  final ScrollController listScrollController = ScrollController();


  Future<List<Message>> getData() async {
    await Future<void>.delayed(Duration(seconds: 1));
    List listAll = [
      {
        "content": {
          "binaryContent": "",
          "content": "",
          "mediaType": 0,
          "mentionedType": 0,
          "pushContent": "",
          "remoteMediaUrl": "",
          "searchableContent": "来了",
          "type": 1
        },
        "conversationType": 0,
        "direction": 0,
        "from": "OZOSOSnn",
        "line": 0,
        "messageId": "197553591863484584",
        "status": 0,
        "target": "xh1DxDuu",
        "timestamp": 1608936893000
      },
      {
        "content": {
          "binaryContent": "",
          "content": "",
          "mediaType": 0,
          "mentionedType": 0,
          "pushContent": "",
          "remoteMediaUrl": "",
          "searchableContent": "来了1",
          "type": 1
        },
        "conversationType": 0,
        "direction": 0,
        "from": "OZOSOSnn",
        "line": 0,
        "messageId": "197553591863484584",
        "status": 0,
        "target": "xh1DxDuu",
        "timestamp": 1608936893000
      },
      {
        "content": {
          "binaryContent": "",
          "content": "",
          "mediaType": 0,
          "mentionedType": 0,
          "pushContent": "",
          "remoteMediaUrl": "",
          "searchableContent": "soga",
          "type": 1
        },
        "conversationType": 0,
        "direction": 0,
        "from": "OZOSOSnn",
        "line": 0,
        "messageId": "197553571143622823",
        "status": 0,
        "target": "xh1DxDuu",
        "timestamp": 1608936883000
      },
      {
        "content": {
          "binaryContent":
          "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",
          "content": "",
          "mediaType": 1,
          "mentionedType": 0,
          "pushContent": "",
          "remoteMediaUrl":
          "https://media.comsince.cn/minio-bucket-image-name/1-OZOSOSnn-1610700412329-5fffad4474e48_5fffad44bef27 (1).gif",
          "searchableContent": "[图片]",
          "type": 1
        },
        "conversationType": 0,
        "direction": 0,
        "from": "OZOSOSnn",
        "line": 0,
        "messageId": "197553561458974886",
        "status": 0,
        "target": "xh1DxDuu",
        "timestamp": 1610700412450
      },
    ];

    List<Message> messagelist = [];
    for (dynamic message in listAll) {
      messagelist.add(Message.fromJson(message));
    }
    return messagelist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Flexible(
            child: StreamBuilder<List<Message>>(
                stream: getData().asStream(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return buildItemMessage(snapshot.data);
                  }  {
                      return Center(
                        child: Column(
                          children: [
                            SizedBox(
                              child: CircularProgressIndicator(),
                              width: 60,
                              height: 60,
                            ),
                          ],
                        ),
                      );
                  }
                }),
          )
        ],
      ),
    );
  }

  buildItemMessage(List<Message> list){
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemBuilder: (context, index) => buildItem(index, list.reversed.toList()),
      itemCount:list.length,
      // reverse: true,
      controller: listScrollController,
    );
  }


  Widget buildItem(int index,List<Message> list){

    return Container(
        child:  Container(
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
                      MediaQuery.of(context).size.width -
                          90 -
                          79),
                  child: Text(
                    "${list[index].content.searchableContent}",
                    style: TextStyle(
                        color: Colors.black,
                        height: 1.4,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}

class Message {
  Content content;
  int conversationType;
  int direction;
  String from;
  int line;
  String messageId;
  int status;
  String target;
  int timestamp;

  Message(
      {this.content,
      this.conversationType,
      this.direction,
      this.from,
      this.line,
      this.messageId,
      this.status,
      this.target,
      this.timestamp});

  Message.fromJson(Map<String, dynamic> json) {
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
    conversationType = json['conversationType'];
    direction = json['direction'];
    from = json['from'];
    line = json['line'];
    messageId = json['messageId'];
    status = json['status'];
    target = json['target'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content.toJson();
    }
    data['conversationType'] = this.conversationType;
    data['direction'] = this.direction;
    data['from'] = this.from;
    data['line'] = this.line;
    data['messageId'] = this.messageId;
    data['status'] = this.status;
    data['target'] = this.target;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Content {
  String binaryContent;
  String content;
  int mediaType;
  int mentionedType;
  String pushContent;
  String remoteMediaUrl;
  String searchableContent;
  int type;

  Content(
      {this.binaryContent,
      this.content,
      this.mediaType,
      this.mentionedType,
      this.pushContent,
      this.remoteMediaUrl,
      this.searchableContent,
      this.type});

  Content.fromJson(Map<String, dynamic> json) {
    binaryContent = json['binaryContent'];
    content = json['content'];
    mediaType = json['mediaType'];
    mentionedType = json['mentionedType'];
    pushContent = json['pushContent'];
    remoteMediaUrl = json['remoteMediaUrl'];
    searchableContent = json['searchableContent'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['binaryContent'] = this.binaryContent;
    data['content'] = this.content;
    data['mediaType'] = this.mediaType;
    data['mentionedType'] = this.mentionedType;
    data['pushContent'] = this.pushContent;
    data['remoteMediaUrl'] = this.remoteMediaUrl;
    data['searchableContent'] = this.searchableContent;
    data['type'] = this.type;
    return data;
  }
}
