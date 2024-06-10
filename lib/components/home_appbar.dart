import 'package:cx_task5/pages/contacts.dart';
import 'package:cx_task5/pages/home.dart';
import 'package:cx_task5/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/ongoingChats.dart';

class HomeAppBar extends StatefulWidget {
  final AssetImage img;
  final String name;
  final Widget contact_chat;
  final bool pageIndex;
  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  HomeAppBar({required this.img, required this.name , required this.contact_chat, required this.pageIndex});
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override

  Widget selectedPage=Chat();
  void select()
  {
  selectedPage=(widget.pageIndex)?ContactPage():HomePage() ;
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (Context) =>
                          ProfilePage( img: widget.img)));
            },
            child: CircleAvatar(
              backgroundImage: widget.img,
              radius: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            widget.name,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () => null,
            child: Container(
              width: 50,
              height: 50,
              child: Icon(
                Icons.camera_alt_rounded,
                size: 30,
              ),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(),
                shape: BoxShape.circle,
                color: Color.fromRGBO(0, 0, 0, 0.04),
                // border: Border.all(color: Colors.black12)
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              select();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>selectedPage));
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(0, 0, 0, 0.04),
              ),
              child: widget.contact_chat,
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
