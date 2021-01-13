import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_weixin/pages/tabbar/contact.dart';
import 'package:flutter_weixin/pages/tabbar/conversation.dart';
import 'package:flutter_weixin/pages/tabbar/find.dart';
import 'package:flutter_weixin/pages/tabbar/mine.dart';
import 'package:flutter_weixin/util/EventBusUtils.dart';
import 'package:flutter_weixin/widgets/common_widgets.dart';

import 'evnetbus/TarbbarDisplayEvent.dart';

class TabbarPage extends StatefulWidget  {

  @override
  State<StatefulWidget> createState() => TabbarPageState();
}

class TabbarPageState extends State<TabbarPage> with WidgetsBindingObserver {
  int _currentIndex = 0;

  void changeCurrentPageWithIndex(int index) {
    setState(() => _currentIndex = index);
  }
  bool tabbarDisplay = false;

  var tabbarDisplayEvent;

@override
  void initState() {
    super.initState();
    tabbarDisplayEvent = eventBus.on<TabbarDisplayEvent>((event) {
      // print('page A received msg');
      setState(() {
        tabbarDisplay = event.display;
      });
    });

  }

  @override
  void dispose() {
    eventBus.off(tabbarDisplayEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ConversationPage(), // 会话
          ContactPage(), // 通讯录
          FindPage(), // 通讯录
          MinePage(), // 我的页面
        ],
      ),
      bottomNavigationBar: Offstage(
          offstage: tabbarDisplay,
          child: _buildBottomNavigationBar(context)
      )

    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return LBottomNavigationBar(
      selectedFontSize: 11,
      unselectedFontSize: 11,
      backgroundColor: Color(0xFFF7F7F7),  //0xFF1E1E1E  暗黑
      unselectedItemColor: Color(0xFF1E1E1E), //0xFF707070 暗黑
      selectedItemColor: Color(0xFF1bac1d),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      margin: 3,
      items: [
        _buildNavigationBarItem(iconName: 'tabbar_conversation', label: '微信'),
        _buildNavigationBarItem(iconName: 'tabbar_contacts', label: '通讯录'),
        _buildNavigationBarItem(iconName: 'tabbar_discover', label: '发现'),
        _buildNavigationBarItem(iconName: 'tabbar_mine', label: '我'),
      ],
      currentIndex: _currentIndex,
      onTap: changeCurrentPageWithIndex,
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem({
    @required String iconName,
    @required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        'images/tabbar/$iconName.webp',
        width: 20,
        height: 20,
      ),
      activeIcon: Image.asset(
        'images/tabbar/${iconName}_sel.webp',
        width: 20,
        height: 20,
      ),
      label: label,
    );
  }
}
