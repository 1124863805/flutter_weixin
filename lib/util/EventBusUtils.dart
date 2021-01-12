import 'dart:async';
import 'package:event_bus/event_bus.dart';

typedef void EventCallback<T>(T event);

class EventBusUtils {
  factory EventBusUtils() => _getInstance();
  static EventBusUtils get instance => _getInstance();
  static EventBusUtils _instance;
  EventBusUtils._internal() {
    // 初始化
    _eventBus = new EventBus();
  }

  //初始化eventBus
  EventBus _eventBus;
  // EventBus get eventBus => _eventBus;

  /// 订阅stream列表
  // List<StreamSubscription> subscriptionList;

  static EventBusUtils _getInstance() {
    if (_instance == null) {
      _instance = new EventBusUtils._internal();
    }
    return _instance;
  }

  /// 开启eventbus订阅 并
  StreamSubscription on<T>(EventCallback<T> callback) {
    StreamSubscription stream = _eventBus.on<T>().listen((event) {
      callback(event);
    });
    // subscriptionList.add(stream);
    return stream;
  }

  /// 发送消息
  void emit(event) {
    _eventBus.fire(event);

  }

  /// 移除steam
  void off(StreamSubscription steam) {
    steam.cancel();
  }
}

var eventBus = EventBusUtils.instance;