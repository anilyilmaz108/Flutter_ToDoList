import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/language_database.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/task_database.dart';
import 'package:todo/screens/add_to_task.dart';
import 'package:todo/screens/settings_page.dart';
import 'package:todo/widget/task_part.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              context: context,
              builder: (context) => SingleChildScrollView(child: AddToTask())
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        //centerTitle: true,
        title: Text(
          "${Provider.of<LanguageDatabase>(context).Selected[0]}",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(Icons.settings,),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                    "${Provider.of<TaskDatabase>(context).tasks.length} ${Provider.of<LanguageDatabase>(context).Selected[1]}",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Consumer<TaskDatabase>(builder:
                    (BuildContext context, TaskData, Widget child) => ListView.builder(
                      itemCount: Provider.of<TaskDatabase>(context).tasks.length,
                      itemBuilder: (context,index) => TaskPart(
                        title: TaskData.tasks[index].title,
                        isDone: TaskData.tasks[index].isDone,
                        toggleStatus: (_){
                          TaskData.toggleStatus(index);
                        },
                        deleteTask: (_){
                          TaskData.deleteTask(index);
                        },
                      ),
                    ),),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
