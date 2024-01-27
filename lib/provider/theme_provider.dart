
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  bool isDarkMode = false ;
  void changeAppMode({ bool? fromShared  })
  {
        if(fromShared != null)
          {
            isDarkMode = fromShared;
            notifyListeners();
          }
        else{
          isDarkMode = !isDarkMode;
          ThemeProvider.setIsDark(value: isDarkMode).then((value) {
            notifyListeners();
            print("is dark value set = $isDarkMode");
          });
        }
  }



  static Future<bool> setIsDark({ required bool value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool("isDark", value);
  }

   static Future<bool> getIsDarkData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     return prefs.getBool("isDark") ?? false;
  }
}