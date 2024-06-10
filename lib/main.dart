import 'package:cx_task5/classes/mode_provider.dart';
import 'package:cx_task5/classes/shared_info.dart';
import 'package:cx_task5/pages/home.dart';
import 'package:cx_task5/pages/profile.dart';
import 'package:cx_task5/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'classes/them_mode.dart';
import 'data_provider/local/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await StoreSimpleData.init();
  runApp(
  

    ChangeNotifierProvider(
      create: (context) =>ModeProvider()..getTheme(),
      child: MyApp(),
    ),
  );

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Messanger',
      theme:Provider.of<ModeProvider>(context).darkMode? ModeTheme.darkMode:ModeTheme.ligtMode,

      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Splash_screen();
  }
}
