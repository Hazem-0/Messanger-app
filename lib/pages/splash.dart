import 'package:cx_task5/pages/home.dart';
import 'package:cx_task5/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../classes/shared_info.dart';
import '../data_provider/local/shared_preferences.dart';


class Splash_screen extends StatefulWidget {
  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  Color color3 = Colors.blue;

  Color color2 = Colors.purple;

  Color color1 =Colors.deepOrangeAccent;


  @override
  void loadLogged() async {

    SharedInfo.logged= await StoreSimpleData.getItem(key: "logged", type: "bool")??false;
    setState(() {});
  }



// Green
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                color1,
                color2,
                color3,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(

              children: [
                SizedBox(
                  height: 200,
                ),
                Image.asset(
                  "assets/imgs/messanger.png",
                  height: 150,
                ),
                Text(
                  "Messanger",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontFamily: "TacOne",
                  ),
                ),
                SizedBox(height: 50,),
                CircularProgressIndicator(
                  value: null, // Indeterminate (loading) state
                  strokeWidth: 2.0, // Thickness of the circle
                  backgroundColor: color3, // Background color
                  valueColor:
                  AlwaysStoppedAnimation<Color>(color1), // Color of the circle
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadLogged();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>(SharedInfo.logged)?HomePage(): LogIn(),
        ),
      );
    });
  }
}
