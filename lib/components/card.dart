import 'package:flutter/material.dart';
//Create custom widget
class CardWidget extends StatefulWidget {
  const CardWidget({Key? key, required this.title, required this.description}) : super(key: key);

  final String title;
  final String description;
  @override
  State<CardWidget> createState() => _CardState();
}

class _CardState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.label_important_outlined, color: Colors.green,),
            title: Text(widget.title),
            subtitle: Text(widget.description),
          )
        ],
      ),
    );
  }
}
