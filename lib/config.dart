import 'package:flutter/material.dart';

// --- Colors --- //
const primaryColor = Colors.yellow;
const secondaryColor = Colors.yellowAccent;
const primaryContrastColor = Color.fromARGB(255, 20, 20, 20);
const secondaryContrastColor = Color.fromARGB(100, 200, 200, 200);

// --- Strings --- //
const appName = "Zettelkasten";
const fleetingName = "Fleeting"; // this is the first folder
const literatureName = "Literature"; // this is the second folder
const permanentName = "Permanent"; // this is the third folder

// --- Themes --- //
var defaultTheme = ThemeData(
  primarySwatch: Colors.yellow,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

// --- Widgets --- //
class MainBackground extends StatefulWidget {
  const MainBackground({Key? key}) : super(key: key);

  @override
  _MainBackgroundState createState() => _MainBackgroundState();
}

class _MainBackgroundState extends State<MainBackground> {
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
            primaryContrastColor,
            primaryContrastColor,
            //secondaryContrastColor,
            //Color.fromARGB(255, 20, 20, 20),
            //Color.fromARGB(255, 20, 20, 20),
            // Color.fromARGB(255, 80, 50, 20),
          ],
        ),
      ),
    );
  }
}
