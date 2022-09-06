import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zettelkasten/Fleeting/writeFleeting.dart';
import '../animations.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/obsidian.dart';
import '../config.dart';
import 'dart:io' as io;

class FileListFleeting extends StatefulWidget {
  const FileListFleeting({Key? key}) : super(key: key);

  @override
  _FileListFleetingState createState() => _FileListFleetingState();
}

class _FileListFleetingState extends State<FileListFleeting>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  List filesInStorage = [];
  late String dir;

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
    controller.dispose();
    super.dispose();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  void _generateListofFiles() {
    dir = _localPath as String;
    setState(() {
      filesInStorage = io.Directory("$dir/fleeting/").listSync();
    });
  }

  @override
  Widget build(BuildContext context) {
    //String bodyStr = "default body";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        title: const Text('$fleetingName Notes'),
      ),
      body: Container(
          color: primaryContrastColor,
          child: Column(children: [
            Container(
                margin: const EdgeInsets.only(
                    top: 5, left: 20, right: 20, bottom: 5),
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    '{{fancy stats}}}',
                    style: TextStyle(color: Colors.orange, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                )),
            Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: _getFilesList()
                    // GridView.count(
                    //   crossAxisCount: 2,
                    //   crossAxisSpacing: 30,
                    //   mainAxisSpacing: 30,
                    //   children: [
                    //     Container(color: Colors.green),
                    //     Container(color: Colors.blue),
                    //     Container(color: Colors.yellow),
                    //     Container(color: Colors.green),
                    //     Container(color: Colors.blue),
                    //     Container(color: Colors.yellow),
                    //     Container(color: Colors.green),
                    //     Container(color: Colors.blue),
                    //     Container(color: Colors.yellow),
                    //     Container(color: Colors.green),
                    //     Container(color: Colors.blue),
                    //     Container(color: Colors.yellow),
                    //     Container(color: Colors.green),
                    //     Container(color: Colors.blue),
                    //     Container(color: Colors.yellow),
                    //   ],
                    // )
                    ))
          ])),

      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewFleeting()),
            );
          }), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _getFilesList() {
    return Container(
      child: GridView.builder(
        //crossAxisCount: 2,
        //crossAxisSpacing: 30,
        //mainAxisSpacing: 30,
        itemCount: filesInStorage.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(filesInStorage[index].path);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 30, crossAxisSpacing: 30),
      ),
    );
  }
}
