import 'package:cx_task5/classes/shared_info.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModeProvider extends ChangeNotifier
{

bool _darkMode=false ;
  bool get darkMode => _darkMode;

  set darkMode(bool value) {
    _darkMode = value;
  }

   toggle ()
  async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    SharedInfo.dark=!SharedInfo.dark;
    darkMode=!darkMode;
    pref.setBool("darkMode", SharedInfo.dark);
    notifyListeners();
  }
  getTheme()async{
    final SharedPreferences pref =await SharedPreferences.getInstance();
    SharedInfo.dark=pref.getBool("darkMode")??false;
    darkMode=await pref.getBool("darkMode")??false;
    notifyListeners();
  }
}