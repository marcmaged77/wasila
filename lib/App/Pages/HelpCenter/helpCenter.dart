import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';





class Url extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Url", home: app2(),
    );
  }
}
class app2 extends StatefulWidget {
  @override
  _app2State createState() => _app2State();
}

class _app2State extends State<app2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6930c3),
        title: Image.asset("images/logo.png", height: 150,),
        elevation: 0,
      ),

    );
  }
}
