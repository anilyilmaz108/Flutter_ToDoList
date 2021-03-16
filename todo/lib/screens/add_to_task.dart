import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/language_database.dart';
import 'package:todo/models/task_database.dart';

class AddToTask extends StatelessWidget {
  final _myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _myController,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                ),
                hintText: "${Provider.of<LanguageDatabase>(context).Selected[2]}",
              ),
              autofocus: true,
            ),
            FlatButton(
                onPressed: (){
                  Provider.of<TaskDatabase>(context,listen: false).addTask(_myController.text);
                  Navigator.pop(context);
            },
                child: Text("${Provider.of<LanguageDatabase>(context).Selected[3]}"),
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
