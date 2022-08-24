import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../animations.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/obsidian.dart';

class NewFleeting extends StatefulWidget {
  @override
  _NewFleetingState createState() => _NewFleetingState();
}

class _NewFleetingState extends State<NewFleeting> {
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
        title: const Text('New Fleeting Note'),
      ),
      body: Center(
          child: Hero(
        tag: 'addFleeting',
        child: Stack(children: [
          mainBackground(),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(50, 0, 0, 0),
                  border: Border.all(
                      color: const Color.fromARGB(100, 255, 255, 0), width: 1)),
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: TextFormField(
                        //initialValue: 'Title',
                        decoration: const InputDecoration(
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(200, 225, 225, 0)),
                            labelText: 'Title',
                            //hintText: 'Title',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(100, 225, 225, 0))),
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 26,
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(200, 225, 225, 0)),
                          labelText: '#Tags',
                        ),
                        style: const TextStyle(
                          color: Color.fromARGB(200, 255, 255, 0),
                          fontSize: 16,
                        ),
                      )),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.all(10),
                        child: TextFormField(
                          //initialValue: 'Title',
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: const InputDecoration(
                              labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(200, 225, 225, 0)),
                              labelText: 'Body'),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 0),
                            fontSize: 18,
                          ),
                        )),
                  ),
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: TextFormField(
                        //initialValue: 'Title',
                        keyboardType: TextInputType.multiline,
                        minLines: 3,
                        maxLines: 10,
                        decoration: const InputDecoration(
                          labelText: 'References',
                          labelStyle: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(200, 225, 225, 0)),
                        ),
                        style: const TextStyle(
                          color: Color.fromARGB(200, 255, 255, 0),
                          fontSize: 16,
                        ),
                      )),
                ],
              ),
            ),
          )
        ]),
      )),

      floatingActionButton: FloatingActionButton(
        heroTag: 'addCard',
        onPressed: () {
          //  Navigator.push(
          //  context,
          //MaterialPageRoute(builder: (context) => NewPage()),
          // );
        },
        tooltip: 'Add Card',
        child: const Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
