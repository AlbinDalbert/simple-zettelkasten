import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class mainBackground extends StatefulWidget {
  @override
  _mainBackgroundState createState() => _mainBackgroundState();
}

class _mainBackgroundState extends State<mainBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 50, 20, 20),
            Color.fromARGB(255, 80, 50, 20),
          ],
        ),
      ),
    );
  }
}

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<mainBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Lottie.asset(
        'lib/lottie/116429-loading.json',
        repeat: true,
        reverse: false,
        animate: true,
        frameRate: FrameRate(60),
      ),
    );
  }
}
