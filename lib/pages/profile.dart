import 'package:cx_task5/classes/mode_provider.dart';
import 'package:cx_task5/classes/shared_info.dart';
import 'package:cx_task5/components/settings_button.dart';
import 'package:cx_task5/pages/contacts.dart';
import 'package:cx_task5/pages/home.dart';
import 'package:cx_task5/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data_provider/local/shared_preferences.dart';

class ProfilePage extends StatefulWidget {


  final ImageProvider img;

  ProfilePage({ required this.img});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 // bool _darkMode = false;



  @override
  void loadProfileData() async {
    SharedInfo.dark =
        await StoreSimpleData.getItem(key: "darkMode", type: "bool") ?? false;
    SharedInfo.status= await StoreSimpleData.getItem(key: "status", type: "bool")??true;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadProfileData();
  }
  bool dark=false ;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: SharedInfo.theme_color,
      appBar: AppBar(
        leading: IconButton(onPressed: ()async{
          await StoreSimpleData.clearAllData();
          if(SharedInfo.dark)
            Provider.of<ModeProvider>(context,listen: false).toggle();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogIn()));
        },icon: Icon(Icons.logout),),
        // backgroundColor: SharedInfo.theme_color,
        scrolledUnderElevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(

                "Done",
                style: TextStyle(
                  color: SharedInfo.dark?Colors.white:Colors.black,
                //    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: widget.img,
                ),
                Positioned(
                  right: 5,
                  bottom: 0,
                  child: Container(
                    child: Icon(
                      Icons.line_axis,
                      color: Colors.white,
                    ),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              SharedInfo.activeUser["name"],
              style: TextStyle(
             //     color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    child: Icon(
                      Icons.dark_mode,
                      size: 33,
                    ),
                    backgroundColor:(SharedInfo.dark)?Colors.white: Colors.black,
                    foregroundColor: (SharedInfo.dark)?Colors.black:Colors.white,
                    radius: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Dark Mode",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  CupertinoSwitch(
                      value: Provider.of<ModeProvider>(context).darkMode,
                      onChanged: (value) async{
                        Provider.of<ModeProvider>(context,listen: false).toggle();
                        setState(() async{

                        });

                        // await StoreSimpleData.setItem(key: "darkMode", value: SharedInfo.dark);
                        print(SharedInfo.dark);
                      }),
                  IconButton(
                      onPressed: () => null,
                      icon: Icon(
                        Icons.navigate_next,
                        color:SharedInfo.dark?Colors.white: Colors.black26,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 15,
              width: 300,
              child: Divider(
                thickness: 0.2,
                color: Colors.grey,
              ),
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    child: Icon(
                      Icons.egg_alt,
                      size: 33,
                    ),
                    backgroundColor:(SharedInfo.status)? Colors.green:Colors.grey,
                    foregroundColor: SharedInfo.dark?Colors.black:Colors.white,
                    radius: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Status",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  CupertinoSwitch(
                      value: SharedInfo.status,
                      onChanged: (value) async  {
                        setState(() {
                          SharedInfo.status = value;
                          // SharedInfo.dark = _darkMode;
                        });
                        await StoreSimpleData.setItem(key: "status", value:SharedInfo.status
                        );

                      }),
                  IconButton(
                      onPressed: () => null,
                      icon: Icon(
                        Icons.navigate_next,
                        color:(SharedInfo.dark)? Colors.white:Colors.black26,
                      )),
                ],
              ),
            ),

            SizedBox(
              height: 15,
              width: 300,
              child: Divider(
                thickness: 0.2,
                color:(SharedInfo.dark)?Colors.white: Colors.grey,
              ),
            ),
            SettingsButton(
                id:2,
                icon: Icon(
                  Icons.alternate_email,
                  size: 33,
                ),
                name: "Username",
                status: SharedInfo.activeUser["username"],
                color: Color.fromRGBO(254, 41, 77, 1)),
            SizedBox(
              height: 15,
              width: 300,
              child: Divider(
                thickness: 0.2,
                color: (SharedInfo.dark)?Colors.white:Colors.grey,
              ),
            ),
            SettingsButton(
                id:3,
                icon: Icon(
                  Icons.phone,
                  size: 33,
                ),
                name: "Phone",
                status:  SharedInfo.activeUser["phone"],
                color: Color.fromRGBO(0, 132, 254, 1)),
            SizedBox(
              height: 35,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Preferences",
                    style: TextStyle(
                        color:(SharedInfo.dark)?Colors.white: Color.fromRGBO(0, 0, 0, 0.35),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SettingsButton(
                id:4,
                icon: Icon(
                  Icons.notifications,
                  size: 33,
                ),
                name: "Notifications & Sounds",
                status: "",
                color: Color.fromRGBO(138, 84, 255, 1)),
            SizedBox(
              height: 15,
              width: 300,
              child: Divider(
                thickness: 0.2,
                color: (SharedInfo.dark)?Colors.white:Colors.grey,
              ),
            ),
            SettingsButton(
                id:5,
                icon: Icon(
                  Icons.people,
                  size: 33,
                ),
                name: "People",
                status: "",
                color: Color.fromRGBO(0, 191, 255, 1)),
            SizedBox(
              height: 15,
              width: 300,
              child: Divider(
                thickness: 0.2,
                color:(SharedInfo.dark)?Colors.white: Colors.grey,
              ),
            ),
            SettingsButton(
                id:6,
                icon: Icon(
                  Icons.messenger_rounded,
                  size: 33,
                ),
                name: "Messaging Settings",
                status: "",
                color: Color.fromRGBO(7, 42, 150, 1)),
            SizedBox(
              height: 15,
              width: 300,
              child: Divider(
                thickness: 0.2,
                color:(SharedInfo.dark)?Colors.white: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
