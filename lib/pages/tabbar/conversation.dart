// 会话页面
import 'package:flutter/material.dart';
import 'package:flutter_weixin/widgets/app_bar.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: LAppBar(
        actions: [
          Icon(Icons.add_circle_outline_sharp)
        ],
        title: new Text("微信 (999)"),
      ),
      body: ListView(
        children: [
          searchWidget(),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Color(0xfff7f7f7),
              border: Border(
                top: BorderSide(color: Color(0xffdbdbdb),width: 0.5),
                bottom: BorderSide(color: Color(0xffdbdbdb),width: 0.5),
              )
            ),
            child: Row(
              children: [
                SizedBox(width: 30),
                Icon(Icons.computer,color: Color(0xff7c7c7c),),
                SizedBox(width: 20),
                new Text("Mac 微信已登录。手机通知已关闭",style: TextStyle(color: Color(0xff7c7c7c),fontSize: 14),)
              ],
            ),
          ),
          for(int i = 0 ; i < 11; i++)
          Container(
            margin: EdgeInsets.only(top: 10,left: 10),
            width: MediaQuery.of(context).size.width,
            height: 75,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 55,
                  height: 55,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwx1.sinaimg.cn%2Fmw690%2F5301ff11ly1gb58jwjhikj20p00p0q4l.jpg&refer=http%3A%2F%2Fwx1.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612966577&t=bc25f2f0258280b4f76a38d123cbe24e",fit: BoxFit.fill)
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 19,
                                child: Container(
                                  child: new Text("孙连理",style: TextStyle(fontSize: 17,),overflow: TextOverflow.ellipsis,),
                                ),
                              ),
                              Expanded(
                                  flex:6,
                                  child:   Container(
                                      margin: EdgeInsets.only(top: 4),
                                      alignment: Alignment.centerRight,
                                      child: new Text("上午9:20",style: TextStyle(color: Color(0xffb4b4b4),fontSize: 13),)
                                  )
                              )
                            ],
                          ),
                          new Text("I love you ",style: TextStyle(fontSize: 14,color: Color(0xffb7b7b7)),overflow: TextOverflow.ellipsis),
                          // SizedBox(height: 5,),
                          Divider()
                        ],
                      ),
                    )
                )
              ],
            ),
          )

        ],
      ),
    );
  }

  Widget searchWidget(){
    return Container(
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Color(0xffebebeb),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.search_sharp,color: Color(0xffb4b4b4)),
                  // SizedBox(width: 10,),
                  new Text("搜索",style: TextStyle(color: Color(0xffb4b4b4),fontSize: 16),)
                ],
              )
            ],
          ),
        )
    );
  }
}
