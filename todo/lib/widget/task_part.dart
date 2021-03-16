import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_database.dart';
import 'package:todo/screens/add_to_task.dart';

class TaskPart extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function toggleStatus;
  final Function deleteTask;

  TaskPart({this.title,this.isDone,this.toggleStatus,this.deleteTask});

  @override
  Widget build(BuildContext context) {

    return Dismissible(
      background: Container(color: Colors.red,),
      key: UniqueKey(),
      onDismissed: deleteTask,
      child: Card(
        color: isDone ? Colors.pink.shade100 : Colors.blue.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: isDone ? 1 : 5,
        child: ListTile(
          title: Text(
              title,textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            decoration: isDone ? TextDecoration.lineThrough : null,
          ),
          ),
          leading: CircleAvatar(
            backgroundImage: AssetImage(
              "assets/splash_image.png",
            ),

          ),
          trailing: Checkbox(
            value: isDone,
            onChanged: toggleStatus,
            activeColor: Colors.pink,
          ),
        ),
      ),
    );
  }
}

