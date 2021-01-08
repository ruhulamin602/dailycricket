import 'dart:math';

import 'package:daily_cricket/src/widgets/custom_rrect_for_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        leading: Icon(Icons.group),
                        title: Text("Browse Series"),
                      ),
                      ListTile(
                        leading: Icon(Icons.group_work_outlined),
                        title: Text("Browse Team"),
                      ),
                      ListTile(
                        leading: Icon(Icons.people_rounded),
                        title: Text("Player Profile"),
                      ),
                      ListTile(
                        leading: Icon(Icons.language_outlined),
                        title: Text("Switch Language"),
                      ),
                      ListTile(
                        leading: Icon(Icons.mode_outlined),
                        title: Text("Dark Mode"),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Settings"),
                      ),
                      ListTile(
                        leading: Icon(Icons.face),
                        title: Text("Facebook"),
                      ),
                      ListTile(
                        leading: Icon(Icons.transfer_within_a_station_rounded),
                        title: Text("Twitter"),
                      ),
                      ListTile(
                        leading: Icon(Icons.face_unlock_sharp),
                        title: Text("Reddit"),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
