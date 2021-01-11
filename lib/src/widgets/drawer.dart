import 'dart:math';


import 'package:daily_cricket/src/resources/icons/my_flutter_app_icons.dart';
import 'package:daily_cricket/src/widgets/custom_rrect_for_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _iconSize = 33;
    Color _color = Colors.black;
    return ClipPath(
        clipper: RectCirculerClipper(),
        child: Container(
            padding: EdgeInsets.only(left: 20),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: 55,
                  height: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 150,
                  padding: EdgeInsets.only(left: 15),
                  child: Image.asset(
                    "assets/images/logo/dailyCricketGreen.png",
                    height: 150,
                    width: 150,
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 500,
                  child: ListView(
                    padding: EdgeInsets.all(0),
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
                          size: _iconSize,color: _color,
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
                          size: _iconSize,color: _color,
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
                          size: _iconSize,color: _color,
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
                          size: _iconSize,color: _color,
                        ),
                        title: Text("Dark Mode"),
                        onTap: () {
                          print("Dark Mood");
                          Navigator.of(context).pop();
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.settings,color: _color,
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
                          size: _iconSize,color: _color,
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
                          size: _iconSize,color: _color,
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
                          size: _iconSize,color: _color,
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
              ],
            )));
  }
}
