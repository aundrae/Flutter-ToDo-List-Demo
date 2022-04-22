import 'package:flutter/material.dart';
import "dart:convert";
class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String title="";
  String description="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
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
              const SizedBox(height: 10),
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
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40), // fromHeight use double.infinity as width and 40 is the height
                ),
                onPressed: () {
                  // Close the screen and return "Nope." as the result.
                  Navigator.pop(context, jsonEncode({"title": title, "description": description}));
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
