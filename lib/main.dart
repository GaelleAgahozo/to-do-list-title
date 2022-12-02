// Started with https://docs.flutter.dev/development/ui/widgets-intro
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_dont_list/completed.dart';
import 'package:to_dont_list/services/app_router.dart';
import 'package:to_dont_list/to_do_items.dart';
import 'package:to_dont_list/todo_desc.dart';
import 'package:to_dont_list/completed.dart';
import 'package:to_dont_list/drawer.dart';

int count = 0;

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});
  static const id = " tasks_screen";
  // final AppRouter appRouter;
  @override
  State createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  // Dialog with text from https://www.appsdeveloperblog.com/alert-dialog-with-a-text-field-in-flutter/
  final TextEditingController _inputController = TextEditingController();
  final ButtonStyle yesStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), primary: Colors.green);
  final ButtonStyle noStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), primary: Colors.red);
  // double count = 0;

  Future<void> _displayTextInputDialog(BuildContext context) async {
    print("Loading Dialog");
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Item To Add'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                  // count++;
                });
              },
              controller: _inputController,
              decoration:
                  const InputDecoration(hintText: "type something here"),
            ),
            actions: <Widget>[
              ElevatedButton(
                key: const Key("OkButton"),
                style: yesStyle,
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    _handleNewItem(valueText);
                    count++;

                    Navigator.pop(context);
                  });
                },
              ),

              // https://stackoverflow.com/questions/52468987/how-to-turn-disabled-button-into-enabled-button-depending-on-conditions
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _inputController,
                builder: (context, value, child) {
                  return ElevatedButton(
                    key: const Key("CancelButton"),
                    style: noStyle,
                    onPressed: value.text.isNotEmpty
                        ? () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          }
                        : null,
                    child: const Text('Cancel'),
                  );
                },
              ),
            ],
          );
        });
  }

  String valueText = "";

  final List<Item> items = [const Item(name: "add more todos")];

  final _itemSet = <Item>{};

  void _handleListChanged(Item item, bool completed) {
    setState(() {
      // When a user changes what's in the list, you need
      // to change _itemSet inside a setState call to
      // trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.

      items.remove(item);
      if (!completed) {
        print("Completing");
        _itemSet.add(item);
        items.add(item);
        count -= 1;
      } else {
        print("Making Undone");
        _itemSet.remove(item);
        items.insert(0, item);
        count += 1;
      }
    });
  }

  void _handleDeleteItem(Item item) {
    setState(() {
      print("Deleting item");
      items.remove(item);
      // count -= 1;
    });
  }

  void _handleNewItem(String itemText) {
    setState(() {
      print("Adding new item");
      Item item = Item(name: valueText);
      items.insert(0, item);
      _inputController.clear();
    });
  }

  Future<void> _handleTasks() async {
    // padding:
    // const EdgeInsets.only(bottom: 50, left: 250);
    // child:
    ElevatedButton(
        key: const Key("SwitchKey"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodoDesc()),
          );
        },
        child: const Text("Next Screen"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 207, 206, 224),
      appBar: AppBar(
        title: const Text('To Do List'),
        backgroundColor: Color.fromARGB(255, 200, 114, 9),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TodoDesc()));

              // Navigator.push(context,
              //     MaterialPageRoute(builder: ((context) => TodoDesc( ))));
            },
            child: Text('Items added $count'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Completed()));
            },
            child: const Text('Completed Tasks'),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(vertical: 8.0),
        // prototypeItem: const FirstRoute(),
        children: items.map((item) {
          return ToDoListItem(
            item: item,
            completed: _itemSet.contains(item),
            onListChanged: _handleListChanged,
            onDeleteItem: _handleDeleteItem,
            onhandleTasks: _handleTasks(),
            // onhandleTasks: _handleTasks(),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 200, 114, 9),
          onPressed: () {
            _displayTextInputDialog(context);
          }),
    );
  }
}

void main() {
  // var appRouter;
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Color.fromARGB(255, 200, 114, 9),
      fontFamily: 'RaleWay',
      brightness: Brightness.light,
    ),
    title: 'To Do List',
    home: ToDoList(),
    // onGenerateRoute: appRouter.onGenerateRoute,
  ));
}
