import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SaveAnimation extends StatefulWidget {
  @override
  _SaveAnimationState createState() => _SaveAnimationState();
}

class _SaveAnimationState extends State<SaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Lottie.asset('lib/lottie/17601-complete-001.json',
                controller: controller)));
  }
}
