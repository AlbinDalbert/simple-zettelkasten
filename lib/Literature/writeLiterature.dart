import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../animations.dart';
import '../config.dart';

class NewLiterature extends StatefulWidget {
  @override
  _NewLiteratureState createState() => _NewLiteratureState();
}

class _NewLiteratureState extends State<NewLiterature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Literature'),
        ),
        body: Center(
            child: Hero(
          tag: 'addLiterature',
          child: Stack(children: [
            MainBackground(),
          ]),
        )));
  }
}
