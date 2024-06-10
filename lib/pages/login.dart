import 'package:cx_task5/components/log_sign_button.dart';
import 'package:cx_task5/pages/home.dart';
import 'package:cx_task5/pages/ongoingChats.dart';
import 'package:cx_task5/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import '../classes/shared_info.dart';
import '../data_provider/local/shared_preferences.dart';
import '../data_provider/local/sqflite.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formkey = GlobalKey<FormState>();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  bool enable_button = false;
  bool redeye_enable = false;
  bool obsec = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 200,
            ),
            Image.asset(
              "assets/imgs/messanger.png",
              height: 100,
            ),
            SizedBox(
              height: 250,
            ),
            Container(
              width: 370,
              // height: 300,
              child: Form(
                onChanged: () {
                  setState(() {
                    if (password_controller.text.isNotEmpty &&
                        email_controller.text.isNotEmpty)
                      enable_button = true;
                    else
                      enable_button = false;
                  });
                },
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      // key: formkey,

                      keyboardType: TextInputType.emailAddress,

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone number or email",
                        hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      controller: email_controller,
                      validator: (String? value) {
                        if (value!.isEmpty)
                          return "Please Enter your email or phone number";
                        var phoneregex = RegExp(r'^01\d+$');
                        RegExp emailregex = RegExp(
                            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

                        if (!(phoneregex.hasMatch(value) ||
                            emailregex.hasMatch(value)))
                          return "Your phone or email is not valid";

                        return null;
                      },
                    ),
                    SizedBox(
                      width: 400,
                      child: Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                    ),
                    TextFormField(
                      // key: formkey,

                      controller: password_controller,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: obsec,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              redeye_enable = !redeye_enable;
                              obsec = !obsec;
                            });
                          },
                          icon: Icon(
                            (password_controller.text.isNotEmpty)
                                ? Icons.remove_red_eye
                                : null,
                            size: 20,
                            color: (redeye_enable)
                                ? Colors.blue
                                : Color.fromRGBO(50, 50, 50, 0.5),
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) return "Please Enter your Password";
                        var regx = RegExp(r'^(?!\s*$)[a-zA-Z0-9- ]{1,20}$');
                        if (!(regx.hasMatch(value)))
                          return "Your password is not valid";
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 400,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          backgroundColor: (enable_button)
                              ? MaterialStatePropertyAll<Color>(Colors.blue)
                              : MaterialStatePropertyAll<Color>(
                                  Color.fromRGBO(50, 50, 50, 0.05)),
                        ),
                        onPressed: (enable_button)
                            ? () async{
                                if (formkey.currentState!.validate()) {

                                  Sqflite sql = new Sqflite();
                                  List users = await sql.readData('SELECT * FROM user  ');
                                  print(users);
                                  dynamic ?response;//=await sql.readData('SELECT * FROM user  WHERE "username"="${email_controller.text}"');
                                  int ?check;


                                  users.forEach((element) {
                                    if(element['username']==email_controller.text ||element['phone']==email_controller.text)
                                    {
                                      response=element;
                                      check=(element['password']==password_controller.text)?1:2;

                                    }

                                  });


                                  if(check==1)
                                  {
                                    {
                                      await StoreSimpleData.setItem(key: "logged", value: true);
                                      await StoreSimpleData.setItem(key: "username", value: response["username"]);
                                      await StoreSimpleData.setItem(key: "phone", value: response["phone"]);
                                      await StoreSimpleData.setItem(key: "name", value: response["name"]);

                                      SharedInfo.activeUser=response;
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()));

                                      showDialog(context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              icon: Icon(
                                                Icons.check_circle_outline_rounded, size: 50,
                                                color: Colors.green,),
                                              // backgroundColor:
                                              title: Text("Log in successfully",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.bold),),
                                              // backgroundColor: Colors.transparent,
                                              surfaceTintColor: Colors.blue,
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('CLOSE',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize: 15),),
                                                ),
                                              ],

                                            );
                                          });
                                    }

                                  }
                                else if(check==2)
                                {

                                  showDialog(context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          icon: Icon(
                                            Icons.warning_amber, size: 50,
                                            color: Colors.yellowAccent,),
                                          // backgroundColor:
                                          title: Text("Wrong Password",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),),
                                          // backgroundColor: Colors.transparent,
                                          surfaceTintColor: Colors.blue,
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('CLOSE',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 15),),
                                            ),
                                          ],

                                        );
                                      });
                                }

                                else {

                                  showDialog(context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          icon: Icon(
                                            Icons.warning_amber, size: 50,
                                            color: Colors.redAccent,),
                                          // backgroundColor:
                                          title: Text("Username Not Found",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),),
                                          // backgroundColor: Colors.transparent,
                                          surfaceTintColor: Colors.blue,
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('CLOSE',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 15),),
                                            ),
                                          ],

                                        );
                                      });
                                }


                        }

                              }
                            :  null,
                        child: Text(
                          "LOG IN",
                          style: TextStyle(
                            color: (enable_button)
                                ? Colors.white
                                : Color.fromRGBO(50, 50, 50, 0.2),
                            // fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 400,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStatePropertyAll<double>(0.5),
                            shape: MaterialStatePropertyAll<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            // backgroundColor:  MaterialStatePropertyAll<Color>(Colors.no),
                          ),
                          child: Text(
                            "CREATE NEW ACCOUNT",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()))),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextButton(
                      onPressed: () => null,
                      child: Text(
                        "FORGOT PASSWORD",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
