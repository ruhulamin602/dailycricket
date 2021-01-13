import 'dart:ui';
import 'dart:math';

import 'package:daily_cricket/src/resources/icons/my_flutter_app_icons.dart';
import 'package:daily_cricket/src/widgets/custom_appbar.dart';

import 'package:daily_cricket/src/widgets/custom_menu_dialog.dart';
import 'package:daily_cricket/src/widgets/carveo_of_appbar.dart';
import 'package:daily_cricket/src/widgets/custom_painter_for_bottomnavigationbar.dart';
import 'package:daily_cricket/src/widgets/custom_switch.dart';
import 'package:daily_cricket/src/widgets/drawer.dart';
import 'package:daily_cricket/src/widgets/editor_pick.dart';
import 'package:daily_cricket/src/widgets/latestNewsSlider.dart';
import 'package:daily_cricket/src/widgets/liveScoreSlider.dart';
import 'package:daily_cricket/src/widgets/sizeconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool enableSwitch = false;
  GlobalKey _scafFoldKey = GlobalKey<ScaffoldState>();

  void _toggle() {
    setState(() {
      enableSwitch = !enableSwitch;
    });
  }

  int currentIndex = 0;
  bool isPressed = true;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(SizeConfig.blockSizeVertical);
    print(SizeConfig.blockSizeHorizontal);

    final size = MediaQuery.of(context).size;
    final height = SizeConfig.safeBlockVertical;
    final double ar = 320 / 187;
    print(MediaQuery.of(context).padding.top);
    // final w = MediaQuery.of(context).size.width;
    return Scaffold(
      // drawerEnableOpenDragGesture: false,
      key: _scafFoldKey,
      drawer: MyDrawer(),

      body: Builder(
        builder: (context) => SafeArea(
          top: false,
          bottom: false,
          child: Stack(
            children: [
              // appbar...
              MyAppBar(
                height: height,
                width: MediaQuery.of(context).size.width,
                enableSwitch: enableSwitch,
                onPressed: () => _toggle(),
              ),
              // live score slider...
              Positioned(
                top:  height * .08,
                left: 0,
                right: 0,
                child: Container(
                    alignment: Alignment.center,
                    height: height * .25,
                    child: LiveScoreSlider()),
              ),
              // Light color shade...
              Positioned(
                  bottom: height * .05,
                  right: 0,
                  left: 0,
                  child: Container(
                    // padding: EdgeInsets.only(0),

                    height: height * .64,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(30)),
                      color: Color.fromRGBO(239, 242, 251, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Editor Pick title
                        Container(
                          margin: EdgeInsets.only(
                              top: height * .020,
                              bottom: height * .014),
                          child: Text(
                            "EDITOR PICK",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Editor Pick container

                        EditorsPick(
                          ctrWidth: size.width * .75,
                          ctrHeight: size.width * 1 / ar * .75,
                          txtHeight: height * .06,
                        ),
                        // Latest News tiele
                        Container(
                          margin: EdgeInsets.only(
                            top: height * .015,
                            bottom: height * .015,
                          ),
                          height: height * .05,
                          child: Stack(
                            children: [
                              Container(
                                child: Center(
                                  child: Text(
                                    "LATEST NEWS",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: size.width * .090,
                                top: 0,
                                child: IconButton(
                                    padding: EdgeInsets.all(0),
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Color.fromRGBO(5, 104, 71, 1),
                                    ),
                                    onPressed: null),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: size.width * 1 / ar * .75,
                            width: size.width,
                            child: LatestNewsSliders()),
                      ],
                    ),
                  )),
              // bottom navigation bar
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: size.width,
                  height: height * .085,
                  child: Stack(
                    clipBehavior: Clip.antiAlias,
                    children: [
                      CustomPaint(
                        size: Size(size.width, height * .1),
                        painter: BNBCustomPainter(),
                      ),
                      Container(
                        width: size.width,
                        height: height * .12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(
                                MyFlutterApp.home,
                                color: currentIndex == 0
                                    ? Colors.white
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(0);
                              },
                              splashColor: Colors.white,
                            ),
                            IconButton(
                                icon: Icon(
                                  MyFlutterApp.newspaper,
                                  color: currentIndex == 1
                                      ? Colors.white
                                      : Colors.grey.shade400,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(1);
                                }),
                            IconButton(
                                icon: Icon(
                                  MyFlutterApp.cricket,
                                  color: currentIndex == 2
                                      ? Colors.white
                                      : Colors.grey.shade400,
                                ),
                                iconSize: 35,
                                onPressed: () {
                                  setBottomBarIndex(2);
                                }),
                            IconButton(
                                icon: Icon(
                                  MyFlutterApp.trophy,
                                  color: currentIndex == 3
                                      ? Colors.white
                                      : Colors.grey.shade400,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(3);
                                }),
                            IconButton(
                                iconSize: 30.0,
                                padding:
                                    EdgeInsets.only(left: 4, right: 4, top: 0),
                                icon: isPressed == true
                                    ? Icon(
                                        MyFlutterApp.next,
                                        color: Colors.grey.shade400,
                                      )
                                    : Transform.rotate(
                                        angle: -pi / 2,
                                        child: Icon(
                                          MyFlutterApp.next,
                                          color: Colors.white,
                                        )),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    useSafeArea: true,
                                    builder: (_) => CustomDialog(
                                      bottom: height * .08,
                                      right: size.width * .04,
                                      height: height * .35,
                                      width: size.width * .6,
                                    ),
                                  ).then((value) {
                                    setState(() {
                                      isPressed = !isPressed;
                                    });
                                  });
                                  setState(() {
                                    isPressed = !isPressed;
                                  });
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
