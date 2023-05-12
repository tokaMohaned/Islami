
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier{

  ThemeMode themeMode=ThemeMode.light;
  String language="en";


  void changeTheme(ThemeMode mode) async{
    themeMode =mode;
    notifyListeners();
    final prefs=await SharedPreferences.getInstance();
//it is final because it is can't change it to another thing
    prefs.setString("mode",
        mode==ThemeMode.light?'light':'dark');
  }

  void changeLang(String lang)
  {
   language=lang;
   notifyListeners();
  }

}