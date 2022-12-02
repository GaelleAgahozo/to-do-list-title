import 'package:flutter/material.dart';
import 'package:to_dont_list/main.dart';
import 'package:to_dont_list/recycle_bin.dart';
import 'package:to_dont_list/todo_desc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: const Color.fromARGB(255, 200, 114, 9),
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headline5,
                // selectionColor: Colors.amber,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Completed()));
              },
              child: const ListTile(
                leading: Icon(Icons.folder_special),
                title: Text("My Tasks"),
                trailing: Text('0'),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => TodoDesc()));

                // Navigator.push(context,
                //     MaterialPageRoute(builder: ((context) => TodoDesc( ))));
              },
              child: const ListTile(
                leading: Icon(Icons.delete),
                title: Text("Recycle bin"),
                trailing: Text('0'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
