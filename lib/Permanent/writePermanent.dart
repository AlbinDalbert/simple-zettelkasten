import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../animations.dart';

class NewPermanent extends StatefulWidget {
  @override
  _NewPermanentState createState() => _NewPermanentState();
}

class _NewPermanentState extends State<NewPermanent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Page'),
        ),
        body: Center(
            child: Hero(
          tag: 'addPermanent',
          child: Stack(children: [
            mainBackground(),
          ]),
        )));
  }
}
