import 'package:flutter/material.dart';
import 'package:to_dont_list/to_do_items.dart';
import 'package:to_dont_list/todo_desc.dart';

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
      appBar: AppBar(
        title: const Text("Completed tasks"),
        // actions: <Widget>[
        //   TextButton(
        //     onPressed: () {
        //       Navigator.of(context)
        //           .push(MaterialPageRoute(builder: (context) => TodoDesc()));
        //     },
        //     child: Text('Items added $count'),
        //   ),

        // ],
      ),
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
