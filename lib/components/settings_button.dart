import 'package:cx_task5/classes/shared_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/contacts.dart';

class SettingsButton extends StatefulWidget {
  final Icon icon;
  final String name;

  final String status;
  final Color color;

  final int id;

  SettingsButton({required this.id,
    required this.icon,
    required this.name,
    required this.status,
    required this.color});

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.id == 2) {
          TextEditingController nameController = TextEditingController(
              text: SharedInfo.activeUser["username"]);

          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) =>
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                          Color.fromRGBO(255, 87, 35, 0.8),
                      Color.fromRGBO(153, 39, 176, 0.8),
                      Color.fromRGBO(33, 150, 243, 0.8)
                  ],),),
        child:Padding(
        padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 20),
        child: Column(children: [
        TextField(
        keyboardType: TextInputType.text,
        controller: nameController,
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        hintText: "Username",
        fillColor: SharedInfo.dark?Colors.black:Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20)),
        ),
        ),
        SizedBox(height: 70,),
        ElevatedButton(onPressed: ()=>null, child : Text("Save"))
        ],
        ),
        )
        )
        );
        } else if (widget.id == 3) {
        TextEditingController phoneController=TextEditingController(text: SharedInfo.activeUser["phone"]);
        //phoneController=SharedInfo.activeUser["phone"];
        showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
        borderRadius:
        BorderRadius.vertical(top: Radius.circular(50)),
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
        Color.fromRGBO(255, 87, 35, 0.8),
        Color.fromRGBO(153, 39, 176, 0.8),
        Color.fromRGBO(33, 150, 243, 0.8)
        ],),),
        child:Padding(
        padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 20),
        child: Column(children: [
        TextField(
        keyboardType: TextInputType.phone,
        controller: phoneController,
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        hintText: "Phone",
        fillColor: SharedInfo.dark?Colors.black:Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(20)),
        ),
        ),
        SizedBox(height: 70,),
        ElevatedButton(onPressed: ()=>null, child : Text("Save"))
        ],
        ),
        )
        )
        );
        } else if (widget.id == 5) {
        Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ContactPage()));
        }
      },
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            CircleAvatar(
              child: widget.icon,
              backgroundColor: widget.color,
              foregroundColor: SharedInfo.dark ? Colors.black : Colors.white,
              radius: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.name,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),

            ),
            Spacer(),
            Expanded(
              child: Text(
                widget.status,
                style: TextStyle(
                    color: SharedInfo.dark ? Colors.white54 : Colors.black26),
                maxLines: null,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
                onPressed: () => null,
                icon: Icon(
                  Icons.navigate_next,
                  color: SharedInfo.dark?Colors.white:Colors.black26,
                )),
          ],
        ),
      ),
    );
  }
}
