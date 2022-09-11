import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:to_dont_list/to_do_items.dart';

class MyTitle extends StatefulWidget {
  const MyTitle({super.key});

  @override
  State<MyTitle> createState() => _TitleState();
}

class _TitleState extends State<MyTitle> {
  get items => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('To Do List'),
        ),
        body:
            // Column(
            //   children: <Widget>[
            SafeArea(
          child: Container(
            child: Column(children: [
              Row(
                children: const [
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        hintText: " enter a title of your to-do-app"),
                  ))
                ],
              )
            ]),
          ),
        ));
  }
}
