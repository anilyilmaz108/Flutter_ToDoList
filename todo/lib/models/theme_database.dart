import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeDatabase with ChangeNotifier{
  ThemeData _blueTheme =ThemeData(
    scaffoldBackgroundColor: Colors.blue,
    backgroundColor: Colors.blue,
    accentColor: Colors.blueAccent,
    primaryColor: Colors.blue[500],
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(color: Colors.blueAccent),
    textTheme: TextTheme(
      headline3: TextStyle(color: Colors.white),
      subtitle1: TextStyle(color: Colors.white),
    ),


    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  ThemeData _pinkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.pink,
  backgroundColor: Colors.pink,
  accentColor: Colors.pinkAccent,
  primaryColor: Colors.pink[500],
  primarySwatch: Colors.pink,
  appBarTheme: AppBarTheme(color: Colors.pinkAccent),
  textTheme: TextTheme(
  headline3: TextStyle(color: Colors.white),
  subtitle1: TextStyle(color: Colors.white),
  ),


  visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  ThemeData _selectedTheme =ThemeData(
    scaffoldBackgroundColor: Colors.blue,
    backgroundColor: Colors.blue,
    accentColor: Colors.blueAccent,
    primaryColor: Colors.blue[500],
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(color: Colors.blueAccent),
    textTheme: TextTheme(
      headline3: TextStyle(color: Colors.white),
      subtitle1: TextStyle(color: Colors.white),
    ),


    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  bool _isBlue = true;

  bool get isBlue => _isBlue;
  ThemeData get selectedTheme => _isBlue ? _blueTheme : _pinkTheme;

  static SharedPreferences _sharedPreferences;

  void Switch(bool selected){
    _isBlue = selected;
    saveToSharedPreferences(selected);
    notifyListeners();
  }

  Future<void>createSharedPreferencesObject()async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveToSharedPreferences(bool value){
    _sharedPreferences.setBool("color", value);
  }

  void loadFromSharedPreferences(){
    _isBlue = _sharedPreferences.getBool("color")??true;
  }


  }