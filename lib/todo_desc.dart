// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new TodoDesc(),
  ));
}

class TodoDesc extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<TodoDesc> {
  int count = 0;

  void incrementCounter() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Number of tasks'),
        backgroundColor: Color.fromARGB(255, 200, 114, 9),
      ),
      body: new Center(
        child: Text('Button Clicks - $count'),
      ),
    );
  }
}
