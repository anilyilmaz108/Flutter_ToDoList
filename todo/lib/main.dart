import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:todo/models/language_database.dart';
import 'package:todo/models/task_database.dart';
import 'package:todo/models/theme_database.dart';
import 'package:todo/screens/home_page.dart';
import 'package:todo/widget/splash.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await TaskDatabase().CreateSharedPreferencesObject();
  await ThemeDatabase().createSharedPreferencesObject();
  await LanguageDatabase().createSharedPreferencesObject();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<TaskDatabase>(create: (BuildContext context) => TaskDatabase()),
    ChangeNotifierProvider<ThemeDatabase>(create: (BuildContext context) => ThemeDatabase()),
    ChangeNotifierProvider<LanguageDatabase>(create: (BuildContext context) => LanguageDatabase()),
  ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Provider.of<TaskDatabase>(context).LoadDataFromSharedPreferences();
    Provider.of<ThemeDatabase>(context).loadFromSharedPreferences();
    Provider.of<LanguageDatabase>(context).loadFromSharedPreferences();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDoList',
      theme: Provider.of<ThemeDatabase>(context).selectedTheme,
      home: Splash(),
    );
  }
}



