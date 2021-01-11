
import 'package:daily_cricket/src/resources/icons/my_flutter_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}

class CustomDialog extends StatelessWidget {
  final double bottom;
  final double right;
  final double height;
  final double width;
  CustomDialog({this.bottom, this.right, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        elevation: 0.0,
        insetPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        backgroundColor: Colors.transparent,
        child: dialogContent(context, bottom, right, height, width),
      ),
    );
  }
}

dialogContent(BuildContext context, double bottom, double right, double height,
    double width) {
  final double _iconSize = 30;
  final Color _color = Colors.black;

  return Stack(
    clipBehavior: Clip.none,
    children: <Widget>[
      Positioned(
        bottom: bottom,
        right: right,
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    offset: Offset(0, 0),
                    blurRadius: 2),
              ]),
          child: Container(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              children: [
                ListTile(
                  leading: Icon(
                    MyFlutterApp.web_search_engine,
                    size: _iconSize,
                    color: _color,
                  ),
                  title: Text("Browse Series"),
                  onTap: () {
                    print("Browse Series");
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    MyFlutterApp.community,
                    size: _iconSize,
                    color: _color,
                  ),
                  title: Text("Browse Team"),
                  onTap: () {
                    print("Browse Team");
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    MyFlutterApp.hockey_player,
                    size: _iconSize,
                    color: _color,
                  ),
                  title: Text("Player Profile"),
                  onTap: () {
                    print("Player Profile");
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    MyFlutterApp.planet_earth,
                    size: _iconSize,
                    color: _color,
                  ),
                  title: Text("Switch Language"),
                  onTap: () {
                    print("Switch Language");
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    MyFlutterApp.moon,
                    size: _iconSize,
                    color: _color,
                  ),
                  title: Text("Dark Mode"),
                  onTap: () {
                    print("Dark Mood");
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: _color,
                    size: _iconSize,
                  ),
                  title: Text("Settings"),
                  onTap: () {
                    print("Setting");
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    MyFlutterApp.facebook,
                    size: _iconSize,
                    color: _color,
                  ),
                  title: Text("Facebook"),
                  onTap: () {
                    print("Facebook");
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    MyFlutterApp.twitter,
                    size: _iconSize,
                    color: _color,
                  ),
                  title: Text("Twitter"),
                  onTap: () {
                    print("Twitter");
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    MyFlutterApp.reddit_1,
                    size: _iconSize,
                    color: _color,
                  ),
                  title: Text("Reddit"),
                  onTap: () {
                    print("Reddit");
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
