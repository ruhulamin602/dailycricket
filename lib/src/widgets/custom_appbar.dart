import 'package:daily_cricket/src/widgets/carveo_of_appbar.dart';
import 'package:daily_cricket/src/widgets/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
    @required this.enableSwitch,
    @required this.onPressed,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  final bool enableSwitch;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      // App bar...
      child: Container(
        padding: EdgeInsets.all(0),
        width: width,
        height: height * .08,
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            CustomPaint(
              size: Size(width, height * .08),
              painter:
                  AppbarCustomPainter(height * .12, height * .18),
            ),
            // app bar menu and toggle button...
            Container(
              padding: EdgeInsets.only(top: height * 0.01),
              width: width,
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
                      width: width * .3,
                      height: height * .2,
                    ),
                  ),
                  GestureDetector(
                    onTap: onPressed,
                    behavior: HitTestBehavior.translucent,
                    child: CustomSwitch(switched: enableSwitch),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
