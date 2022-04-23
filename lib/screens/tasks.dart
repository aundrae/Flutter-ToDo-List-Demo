import 'package:flutter/material.dart';
import 'package:untitled/screens/add_task.dart';
import 'package:untitled/components/card.dart';
import 'dart:convert';

class Tasks extends StatefulWidget {
  const Tasks({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<Map<dynamic, dynamic>> items = [];

  void addTask() {
    _navigateAndDisplaySelection();
  }

  void _navigateAndDisplaySelection() async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTask()),
    );

    // After the Add Task returns a result, hide any previous snackbars
    // and show the new result.
    if (result != null) {
      setState(() {
        final decodedData = jsonDecode(result);
        items.add(decodedData);
      });
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
            const SnackBar(content: Text("New Task Added Successfully")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: items.isNotEmpty
          ? ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Dismissible(
                  // Each Dismissible must contain a Key. Keys allow Flutter to
                  // uniquely identify widgets.
                  key: Key(item["title"]),
                  // Provide a function that tells the app
                  // what to do after an item has been swiped away.
                  onDismissed: (direction) {
                    // Remove the item from the data source.
                    setState(() {
                      items.removeAt(index);
                    });

                    // Then show a snackbar.
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(item["title"] + ' Completed')));
                  },
                  // Show a red background as the item is swiped away.
                  background: Container(
                    color: Colors.green,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: Icon(Icons.check),
                    ),
                  ),
                  child: CardWidget(
                    title: item["title"],
                    description: item["description"],
                  ),
                );
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.check, color: Colors.green, size: 50,),
                  Text("All tasks completed", style: TextStyle(fontSize: 25),)
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
