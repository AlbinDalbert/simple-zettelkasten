import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'animations.dart';

class NewFleeting extends StatefulWidget {
  @override
  _NewFleetingState createState() => _NewFleetingState();
}

class _NewFleetingState extends State<NewFleeting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Fleeting'),
        ),
        body: Center(
            child: Hero(
          tag: 'addFleeting',
          child: Stack(children: [
            mainBackground(),
          ]),
        )));
  }
}
