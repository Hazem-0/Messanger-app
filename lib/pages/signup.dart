import 'package:cx_task5/classes/shared_info.dart';
import 'package:cx_task5/data_provider/local/sqflite.dart';
import 'package:cx_task5/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  // const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool enable_button = false;
  bool redeye_enable = false;
  bool obsec = true;
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  final formkey = GlobalKey<FormState>();

  // var background =Colors.;
  var CircleColor = Color.fromRGBO(174, 198, 191, 0.31);
  var blueButton = Colors.lightBlue;
  var size, width, height;

  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
            Color.fromRGBO(255, 87, 35, 0.8),
            Color.fromRGBO(153, 39, 176, 0.8),
            Color.fromRGBO(33, 150, 243, 0.8)
          ])),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: Image.asset(
                    "assets/imgs/messanger.png",
                    fit: BoxFit.cover,
                  ),
                  width: width / 3,
                  height: height / 6,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 300,
                  // height: 300,
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          // key: formkey,
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "Name",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            hintStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) return "Please Enter your name";
                            var regx = RegExp(r'^[a-zA-Z0-9]+$');
                            if (!(regx.hasMatch(value.toString())))
                              return "Your name  is not valid";

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: phoneController,
                          // key: formkey,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: "Phone",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            hintStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value!.isEmpty)
                              return "Please Enter your phone";
                            var regx = RegExp(r'^01\d+$');
                            if (value.length != 11)
                              return "Your phone is not valid";
                            if (!(regx.hasMatch(value)))
                              return "Your phone is not valid";

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: email_controller,
                          // key: formkey,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_rounded),
                            hintText: "email",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            hintStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey),
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 30),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty)
                              return "Please Enter your email";
                            var regx = RegExp(
                                r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                            if (!(regx.hasMatch(value)))
                              return "Your email is not valid";

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          // key: formkey,
                          controller: password_controller,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: obsec,
                          //maxLength: 50,
                          //maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 30),
                            hintStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey),
                            prefixIcon: Icon(Icons.password_rounded),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obsec = !obsec;
                                  redeye_enable = !redeye_enable;
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
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Password",

                          ),
                          validator: (String? value) {
                            if (value!.isEmpty)
                              return "Please Enter your Password";
                            var regx = RegExp(r'^(?!\s*$)[a-zA-Z0-9- ]{1,20}$');
                            if (!(regx.hasMatch(value)))
                              return "Your password is not valid";
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: ()async {
                    if (formkey.currentState!.validate())  {
                      Sqflite sql = new Sqflite();

                      int check=0;
                      List users = await sql.readData('SELECT * FROM user ');
                      print(users);

                      users.forEach((element) {
                        if(element['username']==email_controller.text &&element['phone']==phoneController.text)
                        {
                          check=1;
                          print("check =${check}");

                        }
                        else if(element['username']==email_controller.text&&check!=1)
                          check=2;
                        else if (element['phone']==phoneController.text&&check!=1)
                          check=3;

                      });
                      print("check =${check}");
                      if(check==0)
                        {
                          int response = await sql.insertData('''
                                    INSERT  INTO "user" ( "name" , "phone","username" ,"password")
                                    VALUES ( "${nameController.text}","${phoneController.text}","${email_controller.text}","${password_controller.text}")
                                     '''
                          );
                          print( response);
                          if(response>0)
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => LogIn()));


                          {
                            print("in");
                            showDialog(context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    icon: Icon(
                                      Icons.check_circle_outline, size: 70,
                                      color: Colors.green,),
                                    // backgroundColor:
                                    title: Text("Signed up Successuflly!!",
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

                      else if(check==1)
                      {

                        {
                          print("in");
                          showDialog(context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  icon: Icon(
                                    Icons.warning_amber, size: 70,
                                    color: Colors.yellow,),
                                  // backgroundColor:
                                  title: Text("Username and Phone Aleardy Exist!!",
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
                      else if (check==2) {
                        print("in");
                        showDialog(context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                icon: Icon(
                                  Icons.warning_amber, size: 70,
                                  color: Colors.yellow,),
                                // backgroundColor:
                                title: Text(
                                  "Username Aleardy Exist!!",
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
                      if(check==3)
                      {
                        print("in");
                        showDialog(context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                icon: Icon(
                                  Icons.warning_amber, size: 70,
                                  color: Colors.yellow,),
                                // backgroundColor:
                                title: Text("Phone Aleardy Exist!!",
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


                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(blueButton),
                    minimumSize:
                        MaterialStatePropertyAll<Size>(Size(width / 1.5, 50)),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width / 5,
                    ),
                    Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => LogIn()));
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: blueButton),
                        )),
                  ],
                ),
                SizedBox(
                  height: 5,
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
