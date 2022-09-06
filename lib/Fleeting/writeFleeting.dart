import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import '../animations.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/obsidian.dart';
import '../config.dart';
import 'package:hashtagable/hashtagable.dart';


class NewFleeting extends StatefulWidget {
  @override
  _NewFleetingState createState() => _NewFleetingState();
}

class _NewFleetingState extends State<NewFleeting>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  final titleTextController = TextEditingController();
  final bodyTextController = TextEditingController();
  final referencesTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1200), vsync: this);

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        Navigator.pop(context);
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    titleTextController.dispose();
    bodyTextController.dispose();
    referencesTextController.dispose();
    controller.dispose();
    super.dispose();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> _localFile(String title) async {
    final path = await _localPath;
    return File('$path/fleeting/$title.md');
  }

  Future<File> writeFile(String title, String body, String references) async {
    final file = await _localFile(title);

    // Write the file
    return file.writeAsString('# $title\n\n$body\n\n## source:\n$references');
  }

  void saveFile(String title, String body, String references) {
    new File('$_localPath/fleeting/$title.md')
        .create(recursive: true)
        .then((File file) {
      writeFile(title, body, references);
    });

//    writeFile(title, body, references);
    //return true;
  }

  @override
  Widget build(BuildContext context) {
    //String bodyStr = "default body";

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('New $fleetingName Note'),
      ),
      body: Center(
          child: Hero(
        tag: 'addFleeting',
        child: Material(
            child: Stack(children: [
          const MainBackground(),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: HashTagTextField(
                        controller: titleTextController,
                        decoration: const InputDecoration(
                            hintText: 'Title',
                            hintStyle:
                                TextStyle(color: secondaryContrastColor)),
                        basicStyle: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 28,
                        ),
                      )),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: HashTagTextField(
                          controller: bodyTextController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: const InputDecoration(
                              hintText: 'Body',
                              hintStyle:
                                  TextStyle(color: secondaryContrastColor)),
                          basicStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 0),
                            fontSize: 20,
                          ),
                        )),
                  ),
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: HashTagTextField(
                        controller: referencesTextController,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 6,
                        decoration: const InputDecoration(
                            hintText: 'References',
                            hintStyle:
                                TextStyle(color: secondaryContrastColor)),
                        basicStyle: const TextStyle(
                          color: Color.fromARGB(200, 255, 255, 0),
                          fontSize: 16,
                        ),
                      )),
                ],
              ),
            ),
          ),
          //SaveAnimation(),
        ])),
      )),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveFile(titleTextController.text, bodyTextController.text,
              referencesTextController.text);
          //Lottie.asset("complete-001.json");
          saveAnimation();
          //Navigator.pop(context);
        },
        tooltip: 'Save Note',
        child: const Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void saveAnimation() => showDialog(
      context: context,
      builder: ((context) => Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
              child: Container(
                  //height: MediaQuery.of(context).size.height * 0.4,
                  //width: MediaQuery.of(context).size.width * 0.4,
                  child: Lottie.asset('lib/lottie/17601-complete-001.json',
                      repeat: false,
                      frameRate: FrameRate(60),
                      controller: controller, onLoaded: (composition) {
            controller.forward();
          }))))));
}
