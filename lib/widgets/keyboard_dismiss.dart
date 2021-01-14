/*
 * @Author: icedays 
 * @Date: 2020-04-26 18:44:44 
 * @Last Modified by:   icedays 
 * @Last Modified time: 2020-04-26 18:44:44 
 */
import 'package:flutter/widgets.dart';

enum KeyboardDismissMode {
  // 监听点击事件
  gestureDetector,
  // 监听触控按下模式
  pointerDown,
  // 监听 Scroll 滚动模式
  scrollNotification,
}

/// 点击关闭键盘
class KeyboardDismiss extends StatelessWidget {
  KeyboardDismiss({
    Key key,
    this.mode = KeyboardDismissMode.gestureDetector,
    @required this.child,
    this.enabled = true,
    this.onDismiss,
  }) : super(key: key);

  final Widget child;
  final bool enabled;
  final VoidCallback onDismiss;
  final KeyboardDismissMode mode;

  @override
  Widget build(BuildContext context) {
    if (this.mode == KeyboardDismissMode.pointerDown) {
      return Listener(
        onPointerDown: (_) {
          if (enabled == false) {
            return;
          }
          FocusScope.of(context).requestFocus(FocusNode());
          if (onDismiss != null) onDismiss();
        },
        child: child,
      );
    } else if (this.mode == KeyboardDismissMode.gestureDetector) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (enabled == false) {
            return;
          }
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: child,
      );
    } else if (this.mode == KeyboardDismissMode.scrollNotification) {
      return NotificationListener<ScrollNotification>(
        onNotification: (var notification) {
          if (enabled == false || notification.metrics.pixels.abs() < 2) {
            return true;
          }
          FocusScope.of(context).requestFocus(FocusNode());
          if (onDismiss != null) onDismiss();
          return true;
        },
        child: child,
      );
    }
    return Container();
  }
}
