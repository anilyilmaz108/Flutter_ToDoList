import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageDatabase with ChangeNotifier{
  List<String> _Ingilizce = ["TO-DO LIST","Tasks","Add new task","ADD","Settings","Change Theme Color","Change Language","Blue","Pink","English"];
  List<String> _Turkce= ["TO-DO LIST","Görevler","Yeni görev ekle","EKLE","Ayarlar","Tema Rengini Değiştir","Dili Değiştir","Mavi","Pembe","Türkçe"];

  List<String> _Selected = ["TO-DO LIST","Görevler","Yeni görev ekle","EKLE","Ayarlar","Tema Rengini Değiştir","Dili Değiştir","Mavi","Pembe","Türkçe"];

  bool _isEnglish = true;
  bool get isEnglish => _isEnglish;
  List<String> get Selected => _isEnglish ? _Ingilizce : _Turkce;



  void toggleStatus(bool selected){
    _isEnglish = selected;
    saveToSharedPreferences(selected);
    notifyListeners();
  }




  static SharedPreferences _sharedPreferences;
  Future<void>createSharedPreferencesObject()async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveToSharedPreferences(bool value){
    _sharedPreferences.setBool("language", value);
  }

  void loadFromSharedPreferences(){
    _isEnglish = _sharedPreferences.getBool("language")??true;
  }

}