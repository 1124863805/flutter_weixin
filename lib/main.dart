import 'package:flutter/material.dart';
import 'package:flutter_weixin/tabbar_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xffebebeb),
          centerTitle: true,
          textTheme: TextTheme(
            title: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold)
          ),
          actionsIconTheme: IconThemeData(
            color:Color(0xff181818),
          ),
          elevation: 0,
          brightness: Brightness.light
        ),
        highlightColor: Colors.transparent, // 长按高亮颜色
        splashColor: Colors.transparent // 禁用水波纹
      ),
      title: '海配车服',
      home: TabbarPage(),
      supportedLocales: [
        const Locale('zh', 'CN'),
        const Locale('en', 'US'),
      ],
    );
  }
}