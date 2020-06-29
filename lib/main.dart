import 'package:flutter/material.dart';
import './Local_json_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isPlayed = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _react() {
    setState(() {
      isPlayed = !isPlayed;
      isPlayed
          ? _animationController.forward()
          : _animationController.reverse();
      color:
      Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: app_Bar(),
        //Body calls the class  containing the Local json logic and  UI page
        body: json_class(),
        floatingActionButton: float_button(),
      ),
    );
  }

  FloatingActionButton float_button() {
    return FloatingActionButton(
        backgroundColor: Colors.blue,
        heroTag: "ball",
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animationController,
          color: Colors.white,
        ),
        onPressed: () => _react());
  }

  Widget app_Bar() {
    return AppBar(
      title: Text(
        " Local Json Chat bot",
        style: TextStyle(fontFamily: 'MavenPro-Bold'),
      ),
      titleSpacing: 1,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.share,
              size: 17,
            ),
            onPressed: () {})
      ],
    );
  }
}
