// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:to_dont_list/to_do_items.dart';
import 'package:to_dont_list/main.dart';
import 'package:to_dont_list/drawer.dart';
import 'package:to_dont_list/completed.dart';
import 'package:to_dont_list/todo_desc.dart';

import 'drawer.dart';

class RecycleBin extends StatelessWidget {
  RecycleBin({super.key});
  // String valueText = "";
  static const id = 'recycle_bin_screen';

  final List<Item> items = [const Item(name: "add more todos")];

  final _itemSet = <Item>{};
  // get items => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 207, 206, 224),
      appBar: AppBar(
        title: const Text('Recycle Bin'),
        backgroundColor: Color.fromARGB(255, 200, 114, 9),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),

      // Navigator.push(context,
      //     MaterialPageRoute(builder: ((context) => TodoDesc( ))));
      //   },
      //   child: Text('Items added $count'),
      // ),
      //     TextButton(
      //       onPressed: () {
      //         Navigator.of(context).push(
      //             MaterialPageRoute(builder: (context) => const Completed()));
      //       },
      //       child: const Text('Completed Tasks'),
      //     ),
      //   ],
      // ),
      drawer: MyDrawer(),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        // prototypeItem: const FirstRoute(),
        children: items.map((item) {
          return ToDoListItem(
            item: item,
            completed: _itemSet.contains(item),
            onListChanged: _handleListChanged,
            onDeleteItem: _handleDeleteItem,
            // ignore: void_checks
            onhandleTasks: _handleTasks(),
            // onhandleTasks: _handleTasks(),
          );
        }).toList(),
      ),
    );
  }
}

// class _handleTasks {}
Future<void> _handleTasks() async {
  // padding:
  // const EdgeInsets.only(bottom: 50, left: 250);
  // child:
  // ElevatedButton(
  //     key: const Key("SwitchKey"),
  //     // onPressed: () {
  //     //   var context2 = context;
  //     //   Navigator.push(
  //     //     context2,
  //     //     MaterialPageRoute(builder: (context) => TodoDesc()),
  //     //   );
  //     // },
  //     child: const Text("Next Screen"));
}
void _handleDeleteItem(Item item) {
  setState(() {
    print("Deleting item");
    var items;
    items.remove(item);
    // count -= 1;
  });
}

void _handleListChanged(Item item, bool completed) {
  setState(() {
    // When a user changes what's in the list, you need
    // to change _itemSet inside a setState call to
    // trigger a rebuild.
    // The framework then calls build, below,
    // which updates the visual appearance of the app.

    var items;
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

void setState(Null Function() param0) {}

class _itemSet {
  static contains(item) {}

  static void add(Item item) {}

  static void remove(Item item) {}
}

// class _handleTasks {
// }

//  void _handleDeleteItem(Item item) {
//     setState(() {
//       print("Deleting item");
//       var items;
//       items.remove(item);
//       // count -= 1;
//     });
//   }

// void setState(Null Function() param0) {
// }
// void setState(Null Function() param0) {}

// class _handleListChanged {
// }

// class _itemSet {
//   static contains(item) {}
// }

int count = 0;

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(title: const Text("Completed tasks")),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        // prototypeItem: const FirstRoute(),
        children: items.map((item) {
          return ToDoListItem(
            item: item,
            completed: _itemSet.contains(item),
            onDeleteItem: (Item item) {},
            onListChanged: (Item item, bool completed) {}, onhandleTasks: null,

            // onhandleTasks: _handleTasks(),
          );
        }).toList(),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class _inputController {
  static void clear() {}
}
