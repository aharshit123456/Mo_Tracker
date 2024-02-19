import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _settingsState();
}

class _settingsState extends State<Settings>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color.fromRGBO(255, 148, 148, 1),
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }


}