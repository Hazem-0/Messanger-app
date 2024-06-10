import 'package:cx_task5/classes/shared_info.dart';
import 'package:flutter/material.dart';

import '../components/friend_request.dart';

class FriendsPage extends StatefulWidget {
  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  List<Widget> friends = SharedInfo.friends;

  Widget build(BuildContext context) {
    return Expanded(
        child: (friends.isEmpty)?Center(child: Text("No Requests",style:TextStyle(fontSize: 20) ,),):Container(
            child: ListView.builder(
      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          color: Colors.redAccent,
          alignment: Alignment.centerLeft,
          // padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
        secondaryBackground: Container(
          color: Colors.greenAccent,
          alignment: Alignment.centerRight,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
        onDismissed: (direction) {
          bool green=true;
          if(direction== DismissDirection.startToEnd)
            {
              green=false;
            }
          SharedInfo.friends.removeAt(index);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(microseconds: 1500),
              content:(green)?Text("Accepted"): Text('Rejected'),
              backgroundColor:(green)?Colors.greenAccent: Colors.red,
            ),
          );
        },
        child: SharedInfo.friends[index],
      ),
      itemCount:SharedInfo.friends.length,
    )));
  }
}
