import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'animations.dart';
import 'Permanent/writePermanent.dart';
import 'Fleeting/writeFleeting.dart';
import 'Fleeting/fileListFleeting.dart';
import 'Literature/writeLiterature.dart';
import 'config.dart';
import 'dart:math';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

//import 'package:flutter_native_splash/flutter_native_splash.dart';

Future main() async {
  // final database = openDatabase(
  //   join(await getDatabasesPath(), 'notes.db'),
  //   onCreate: (db, version) {
  //     return db.execute(
  //       'CREATE TABLE notes(id INTEGER PRIMARY KEY, type INTEGER, title TEXT, created INTEGER, modified INTEGER)',
  //     );
  //   },
  //   version: 1,
  // );

  // FlutterNativeSplash.removeAfter(initialization);
  //FlutterNativeSplash.remove(initialization);
  await initialization(null);
  //FlutterNativeSplash.remove();

  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  // load some stuff
  await Future.delayed(const Duration(seconds: 5));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: primaryColor, foregroundColor: primaryContrastColor),
          primarySwatch: primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: const ColorScheme(
              onPrimary: primaryContrastColor,
              onSecondary: primaryContrastColor,
              error: Colors.red,
              onError: Colors.redAccent,
              brightness: Brightness.dark,
              primary: primaryColor,
              secondary: primaryColor,
              background: primaryContrastColor,
              onBackground: primaryColor,
              surface: primaryColor,
              onSurface: primaryContrastColor),
          brightness: Brightness.dark),
      color: primaryContrastColor,
      home: const MyHomePage(title: appName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              const MainBackground(),
              //Lottie.asset('lib/lottie/70532-background.json'),
              Center(
                  // This is the column with the three main folders.
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ------ The container for 'Fleeting' notes --------
                  Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow, width: 1.5)),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FileListFleeting()),
                            );
                          },
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                    Container(
                                        margin: const EdgeInsets.only(left: 20),
                                        child: Text(fleetingName,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                color: Colors.yellow,
                                                fontWeight: FontWeight.bold))),
                                    //Expanded(
                                    InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    NewFleeting()),
                                          );
                                        },
                                        child: Hero(
                                            tag: 'addFleeting',
                                            child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                margin: EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.05),
                                                color: Colors.yellow,
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                ))))
                                  ]))))),
                  // ------- The container for 'Literature' notes ----------
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow, width: 1.5)),

                      //color: Colors.transparent,
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  child: Text(literatureName,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold))),
                              //Expanded(
                              InkWell(
                                child: Hero(
                                    tag: 'addLiterature',
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      margin: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05),
                                      color: Colors.yellow,
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.black,
                                      ),
                                    )),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NewLiterature()),
                                  );
                                },
                              )
                            ],
                          )))),
                  // -------- The container for 'Permanent' notes ---------
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow, width: 1.5)),

                      //color: Colors.transparent,
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  child: Text(permanentName,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold))),
                              //Expanded(
                              InkWell(
                                child: Hero(
                                    tag: 'addPermanent',
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      margin: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05),
                                      color: Colors.yellow,
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.black,
                                      ),
                                    )),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NewPermanent()),
                                  );
                                },
                              )
                            ],
                          ))))
                ],
              )),
            ],
          ),
        ),
        // ------ The bottom navigation bar ----------
        bottomNavigationBar: BottomAppBar(
            color: primaryColor,
            child: Row(
              children: [
                // TODO add menu.
                IconButton(
                  color: primaryContrastColor,
                  icon: const Icon(Icons.menu),
                  onPressed: () {},
                ),
                const Spacer(),
                // TODO add Search function
                // TODO add animation
                IconButton(
                    color: primaryContrastColor,
                    icon: const Icon(Icons.search),
                    onPressed: () {}),
              ],
            )));
  }
}
