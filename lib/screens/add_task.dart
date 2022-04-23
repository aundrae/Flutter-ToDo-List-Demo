import 'package:flutter/material.dart';
import "dart:convert";
class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  //Variables used to hold title and description
  String title="";
  String description="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //1 way to handle input field
            TextFormField(
              onChanged: (text){
                setState(() {
                  title = text;
                });
              },

              decoration: const InputDecoration(
                labelText: 'Enter Task Title',
                border: OutlineInputBorder(),
              ),
            ),
            //Used to make space
            const SizedBox(height: 10),
            //Used to handle multiple line description
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              decoration: const InputDecoration(
                labelText: "Enter Description",
                border: OutlineInputBorder(),
              ),
              onChanged: (text){
                setState(() {
                  description = text;
                });
              },
            ),
            //Used to make space
            const SizedBox(height: 10),
            //Used to submit the data to next screen
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40), // fromHeight use double.infinity as width and 40 is the height
              ),
              onPressed: () {
                Navigator.pop(context, jsonEncode({"title": title, "description": description}));
              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
