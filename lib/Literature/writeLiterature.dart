import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../animations.dart';
import '../config.dart';

class NewLiterature extends StatefulWidget {
  @override
  _NewLiteratureState createState() => _NewLiteratureState();
}

class _NewLiteratureState extends State<NewLiterature>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 1200), vsync: this);

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
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //String bodyStr = "default body";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('New $literatureName Note'),
      ),
      body: Center(
          child: Hero(
        tag: 'addLiterature',
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
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Title',
                            hintStyle:
                                TextStyle(color: secondaryContrastColor)),
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 28,
                        ),
                      )),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: const InputDecoration(
                              hintText: 'Body',
                              hintStyle:
                                  TextStyle(color: secondaryContrastColor)),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 0),
                            fontSize: 20,
                          ),
                        )),
                  ),
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 6,
                        decoration: const InputDecoration(
                            hintText: 'References',
                            hintStyle:
                                TextStyle(color: secondaryContrastColor)),
                        style: const TextStyle(
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
        heroTag: 'addCard',
        onPressed: () {
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
