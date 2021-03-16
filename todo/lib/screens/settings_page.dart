import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/language_database.dart';
import 'package:todo/models/theme_database.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Text blueText = Text("${Provider.of<LanguageDatabase>(context).Selected[7]}", style: TextStyle(color: Colors.blue),);
    Text pinkText = Text("${Provider.of<LanguageDatabase>(context).Selected[8]}", style: TextStyle(color: Colors.pink),);

    Text English = Text("${Provider.of<LanguageDatabase>(context).Selected[9]}", style: TextStyle(color: Colors.blue),);
    Text Turkce = Text("${Provider.of<LanguageDatabase>(context).Selected[9]}", style: TextStyle(color: Colors.blue),);

    bool _value = Provider.of<ThemeDatabase>(context).isBlue;
    bool _languageValue = Provider.of<LanguageDatabase>(context).isEnglish;

    return Scaffold(
      appBar: AppBar(
        title: Text("${Provider.of<LanguageDatabase>(context).Selected[4]}"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: SwitchListTile(
              inactiveTrackColor: Colors.pink,
              inactiveThumbColor: Colors.pink,
              onChanged: (bool selected) {
                Provider.of<ThemeDatabase>(context,listen: false).Switch(selected);
              },
              value: _value,
              title: Text("${Provider.of<LanguageDatabase>(context).Selected[5]}",style: TextStyle(color: Colors.black),),
              subtitle: _value ? blueText : pinkText,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            color: Colors.white,
            child: SwitchListTile(
              inactiveTrackColor: Colors.pink,
              inactiveThumbColor: Colors.pink,
              onChanged: (bool selected) {
                Provider.of<LanguageDatabase>(context,listen: false).toggleStatus(selected);
              },
              value: _languageValue,
              title: Text("${Provider.of<LanguageDatabase>(context).Selected[6]}",style: TextStyle(color: Colors.black),),
              subtitle: _languageValue ? English : Turkce,
            ),
          ),

        ],
      ),
    );
  }
}
