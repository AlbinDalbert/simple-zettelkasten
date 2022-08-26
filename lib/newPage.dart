import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'animations.dart';
import 'config.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Page'),
        ),
        body: Center(
            child: Hero(
          tag: 'addCard',
          child: Stack(children: [
            MainBackground(),
          ]),
        )));
  }
}
