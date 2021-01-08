import 'dart:ui';

import 'package:daily_cricket/src/widgets/custom_button.dart';
import 'package:daily_cricket/src/widgets/custom_rrect_for_appbar_extention.dart';
import 'package:daily_cricket/src/widgets/custom_rrect_for_bottomnavigationbar.dart';
import 'package:daily_cricket/src/widgets/custom_switch.dart';
import 'package:daily_cricket/src/widgets/drawer.dart';
import 'package:daily_cricket/src/widgets/latestNewsSlider.dart';
import 'package:daily_cricket/src/widgets/liveScoreSlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

    // final w = MediaQuery.of(context).size.width;
    return Scaffold(
      // drawerEnableOpenDragGesture: false,
      key: _scafFoldKey,
      drawer: MyDrawer(),

      body: Builder(
        builder: (context) => Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: 80,
                child: Stack(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: AppbarCustomPainter(130, 200),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40),
                      width: size.width,
                      height: 100,
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
                              width: 125,
                              height: 27,
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
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: Container(
                  alignment: Alignment.center,
                  height: 250,
                  child: CarouselWithIndicatorDemo()),
            ),
            Positioned(
                top: 330,
                right: 0,
                left: 0,
                child: Container(
                  height: 600,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(239, 242, 251, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          "EDITOR PICK",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      EditorsPick(),
                      Container(
                        margin: EdgeInsets.only(
                          top: 0,
                          bottom: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: Text(
                                "LATEST NEWS",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.green,
                                ),
                                onPressed: null),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 0),
                          height: 200,
                          child: CarouselWithIndicator()),
                    ],
                  ),
                )),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: 80,
                child: Stack(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: BNBCustomPainter(),
                    ),
                    Container(
                      width: size.width,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.home,
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
                                Icons.featured_play_list_outlined,
                                color: currentIndex == 1
                                    ? Colors.white
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(1);
                              }),
                          IconButton(
                              icon: Icon(
                                Icons.sports_cricket_outlined,
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
                                Icons.compass_calibration_outlined,
                                color: currentIndex == 3
                                    ? Colors.white
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(3);
                              }),
                          // IconButton(
                          //     icon: Icon(
                          //       currentIndex == 4?Icons.arrow_upward_outlined:Icons.arrow_forward_ios_outlined,
                          //       color: currentIndex == 4
                          //           ? Colors.white
                          //           : Colors.grey.shade400,
                          //     ),
                          //     onPressed: () {
                          //       setBottomBarIndex(4);
                          //     }),
                          IconButton(
                            icon: CustomBTN(
                              pressed: currentIndex == 4,
                            ),
                            onPressed: (){
                              setBottomBarIndex(4);
                            },
                          )
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
    );
  }
}

class EditorsPick extends StatelessWidget {
  const EditorsPick({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
        height: 200,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(0),
                height: 160,
                width: 332,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15)),
                child: Container(
                  width: 332,
                  height: 35,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 3,
                        color: Colors.grey.withOpacity(.5),
                        offset: Offset.fromDirection(0, 0)),
                  ]),
                  padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'India Lost by 102 runs',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'India Lost by 102 runs',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 8.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        // Placeholder(
        //   color: Colors.transparent,
        // ),
        );
  }
}
