// 会话页面
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_weixin/widgets/app_bar.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  // 总数
  int _count = 20;
  LinkHeaderNotifier _linkNotifier;
  ValueNotifier<bool> _secondFloorOpen;

  @override
  void initState() {
    super.initState();
    _linkNotifier = LinkHeaderNotifier();
    _secondFloorOpen = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    super.dispose();
    _linkNotifier.dispose();
    _secondFloorOpen.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffebebeb),
      body: Column(
        children: [
          SecondFloorWidget(_linkNotifier, _secondFloorOpen),
          Expanded(
            child: EasyRefresh.custom(
              header: LinkHeader(
                _linkNotifier,
                extent: 70.0,
                triggerDistance: 70.0,
                completeDuration: Duration(milliseconds: 500),
              ),
              onRefresh: () async {
                if (_secondFloorOpen.value) return;
                await Future.delayed(Duration(seconds: 2), () {
                  if (mounted) {
                    setState(() {
                      _count = 20;
                    });
                  }
                });
              },
              onLoad: () async {
                await Future.delayed(Duration(seconds: 2), () {
                  if (mounted) {
                    setState(() {
                      _count += 20;
                    });
                  }
                });
              },
              slivers: <Widget>[

                SliverAppBar(
                  elevation: 0,
                  toolbarHeight: 40,
                  pinned: true,
                  title: new Text("微信(599)"),
                  actions: [
                    Container(
                      padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.add_circle_outline_sharp)
                    )
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
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
                          SizedBox(width: 20),
                          Icon(Icons.computer,color: Color(0xff7c7c7c),),
                          SizedBox(width: 20),
                          new Text("Mac 微信已登录。手机通知已关闭",style: TextStyle(color: Color(0xff7c7c7c),fontSize: 14),)
                        ],
                      ),
                    ),


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
                  ]),
                ),



              ],

            ),
          ),
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

/// 二楼视图
class SecondFloorWidget extends StatefulWidget {
  // Header连接通知器
  final LinkHeaderNotifier linkNotifier;
  // 二楼开启状态
  final ValueNotifier<bool> secondFloorOpen;

  const SecondFloorWidget(this.linkNotifier, this.secondFloorOpen, {Key key})
      : super(key: key);

  @override
  SecondFloorWidgetState createState() {
    return SecondFloorWidgetState();
  }
}

class SecondFloorWidgetState extends State<SecondFloorWidget> {
  // 触发二楼高度
  final double _openSecondFloorExtent = 100.0;
  // 指示器值
  double _indicatorValue = 0.0;

  // 二楼高度
  double _secondFloor = 0.0;
  // 显示展开收起动画
  bool _toggleAnimation = false;
  Duration _toggleAnimationDuration = Duration(milliseconds: 300);
  // 二楼是否打开
  bool _isOpen = false;

  RefreshMode get _refreshState => widget.linkNotifier.refreshState;
  double get _pulledExtent => widget.linkNotifier.pulledExtent;

  @override
  void initState() {
    super.initState();
    widget.linkNotifier.addListener(onLinkNotify);
  }

  void onLinkNotify() {
    setState(() {
      if (_refreshState == RefreshMode.armed ||
          _refreshState == RefreshMode.refresh) {
        _indicatorValue = null;
        // 判断是否到展开二楼
        if (widget.secondFloorOpen.value && !_toggleAnimation) {
          _isOpen = true;
          _secondFloor = MediaQuery.of(context).size.height;
          _toggleAnimation = true;
          Future.delayed(_toggleAnimationDuration, () {
            if (mounted) {
              setState(() {
                _toggleAnimation = false;
              });
            }
          });
        }
      } else if (_refreshState == RefreshMode.refreshed ||
          _refreshState == RefreshMode.done) {
        _indicatorValue = 1.0;
      } else {
        if (_refreshState == RefreshMode.inactive) {
          _indicatorValue = 0.0;
          _toggleAnimation = true;
          Future.delayed(_toggleAnimationDuration, () {
            if (mounted) {
              setState(() {
                _toggleAnimation = false;
              });
            }
          });
        } else {
          double indicatorValue = _pulledExtent / 70.0 * 0.8;
          _indicatorValue = indicatorValue < 0.8 ? indicatorValue : 0.8;
          // 判断是否到达打开二楼高度
          if (_refreshState == RefreshMode.drag) {
            if (_pulledExtent >= _openSecondFloorExtent) {
              widget.secondFloorOpen.value = true;
            } else {
              widget.secondFloorOpen.value = false;
            }
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_isOpen) {
          setState(() {
            _isOpen = false;
            _toggleAnimation = true;
            Future.delayed(_toggleAnimationDuration, () {
              if (mounted) {
                setState(() {
                  _toggleAnimation = false;
                });
              }
            });
          });
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: AnimatedContainer(
        height: _isOpen
            ? _secondFloor
            : _refreshState == RefreshMode.inactive
            ? 0.0
            : _pulledExtent,
        color: Colors.white,
        duration: _toggleAnimation
            ? _toggleAnimationDuration
            : Duration(milliseconds: 1),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Container(width: 100,height: 100,color: Colors.red,),
              ),
            ),
            _isOpen
                ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            )
                : Container(),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: AnimatedCrossFade(
                firstChild: Center(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      bottom: 20.0,
                      top: 10.0,
                    ),
                    width: 24.0,
                    height: 24.0,
                    child: Offstage(
                      offstage: widget.secondFloorOpen.value,
                      child: CircularProgressIndicator(
                        value: _indicatorValue,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                        strokeWidth: 2.4,
                      ),
                    ),
                  ),
                ),
                secondChild: Center(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      bottom: 20.0,
                      top: 10.0,
                    ),
                    child: Offstage(
                      offstage: !widget.secondFloorOpen.value,
                      child: Text(
                        "213",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                crossFadeState: widget.secondFloorOpen.value
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
