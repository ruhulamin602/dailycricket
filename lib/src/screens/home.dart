import 'dart:ui';
import 'dart:math';


import 'package:daily_cricket/src/resources/icons/my_flutter_app_icons.dart';

import 'package:daily_cricket/src/widgets/custom_menu_dialog.dart';
import 'package:daily_cricket/src/widgets/custom_rrect_for_appbar_extention.dart';
import 'package:daily_cricket/src/widgets/custom_rrect_for_bottomnavigationbar.dart';
import 'package:daily_cricket/src/widgets/custom_switch.dart';
import 'package:daily_cricket/src/widgets/drawer.dart';
import 'package:daily_cricket/src/widgets/latestNewsSlider.dart';
import 'package:daily_cricket/src/widgets/liveScoreSlider.dart';
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
    final size = MediaQuery.of(context).size;
    final double ar = 320 / 187;

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
              Positioned(
                top: 0,
                left: 0,
                // App bar...
                child: Container(
                  width: size.width,
                  height: size.height * .1,
                  child: Stack(
                    clipBehavior: Clip.antiAlias,
                    children: [
                      CustomPaint(
                        size: Size(size.width, size.height * .1),
                        painter: AppbarCustomPainter(
                            size.height * .12, size.height * .18),
                      ),
                      // app bar menu and toggle button...
                      Container(
                        padding: EdgeInsets.only(top: size.height * .035),
                        width: size.width,
                        height: size.height * .8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              splashColor: Colors.white,
                            ),
                            Container(
                              child: Image.asset(
                                "assets/images/logo/dailyCricketWhite.png",
                                width: size.width * .3,
                                height: size.height * .2,
                              ),
                            ),
                            GestureDetector(
                              onTap: _toggle,
                              behavior: HitTestBehavior.translucent,
                              child: CustomSwitch(switched: enableSwitch),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // live score slider...
              Positioned(
                top: size.height * .11,
                left: 0,
                right: 0,
                child: Container(
                    alignment: Alignment.center,
                    height: size.height * .25,
                    child: LiveScoreSlider()),
              ),
              // Light color shade...
              Positioned(
                  top: size.height * .35,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: size.height * .63,
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
                              top: size.height * .020,
                              bottom: size.height * .014),
                          child: Text(
                            "EDITOR PICK",
                            style: TextStyle(
                                
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Editor Pick container
                        EditorsPick(
                          ctrWidth: size.width * .75,
                          ctrHeight: size.width * 1 / ar * .75,
                          txtHeight: size.height * .06,
                        ),
                        // Latest News tiele
                        Container(
                          // margin: EdgeInsets.only(
                          //   top: size.height * .025,
                          //   bottom: size.height * .020,
                          // ),
                          height: size.height * .05,

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
                            height: size.width * 1 / ar * .80,
                            width: size.width,
                            child: CarouselWithIndicator()),
                      ],
                    ),
                  )),
              // bottom navigation bar
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: size.width,
                  height: size.height * .085,
                  child: Stack(
                    clipBehavior: Clip.antiAlias,
                    children: [
                      CustomPaint(
                        size: Size(size.width, size.height * .1),
                        painter: BNBCustomPainter(),
                      ),
                      Container(
                        width: size.width,
                        height: size.height * .12,
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
                                      bottom: size.height * .08,
                                      right: size.width * .04,
                                      height: size.height * .35,
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

class EditorsPick extends StatelessWidget {
  final double ctrHeight;

  final double ctrWidth;
  final double txtHeight;

  final double txtWidth;

  EditorsPick({
    Key key,
    this.ctrHeight,
    this.ctrWidth,
    this.txtHeight,
    this.txtWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      width: ctrWidth ?? 332,
      height: ctrHeight ?? 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        shape: BoxShape.rectangle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              color: Colors.grey.withOpacity(.1),
              offset: Offset(0, 5)),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(0),
            width: ctrWidth,
            height: ctrHeight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
                fit: BoxFit.fill,
                width: ctrWidth,
                height: ctrHeight,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              child: Container(
                width: ctrWidth,
                height: txtHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'India Lost by 102 runs',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '5 minutes ago',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
