//import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/models/task.dart';

class TaskDatabase with ChangeNotifier{
  List<Task> _tasks = [
  ];



  static SharedPreferences _sharedPreferences;

  List<Task> get tasks => _tasks;
  List<String> _taskAsString=[];


  void toggleStatus(int index){
    _tasks[index].toogleStatus();
    SaveTaskToSharedPreferences(_tasks);
    notifyListeners();
  }

  void deleteTask(int index){
    _tasks.removeAt(index);
    SaveTaskToSharedPreferences(_tasks);
    notifyListeners();
  }
  
  void addTask(String title){
    _tasks.add(Task(title: title));
    SaveTaskToSharedPreferences(_tasks);
    notifyListeners();
  }

  //UnmodifiableListView<Task> get tasks =>UnmodifiableListView( _tasks);

  Future<void> CreateSharedPreferencesObject()async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void SaveTaskToSharedPreferences(List<Task> tasks){
    _taskAsString.clear();
    for(var task in tasks){
      _taskAsString.add(jsonEncode(task.toMap()));
    }
    _sharedPreferences.setStringList("toDo", _taskAsString);
  }


  void LoadDataFromSharedPreferences(){
    List<String> tempList = _sharedPreferences.getStringList('toDo')??[];
    _tasks.clear();
    for(var task in tempList){
      _tasks.add(Task.fromMap(json.decode(task)));
    }}



}