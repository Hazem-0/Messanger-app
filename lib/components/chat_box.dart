import 'package:cx_task5/classes/shared_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/chat.dart';
import 'avatar.dart';

class ChatBox extends StatefulWidget {
  final Avatar person_avatar;
  final String name;
  final String chat_text;
   bool seen;
  final String date;

  ChatBox(
      {required this.person_avatar,
        required this.name,
        required this.chat_text,
        required this.seen,
        required this.date});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatScreen()),
    );
      },
      child: Container(
        height: 120,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Avatar on the left
            SizedBox(width: 10,),
            Column(
              children: [
                SizedBox(height: 5,),
                widget.person_avatar,
              ],
            ),
            SizedBox(width: 15), // Add some space between avatar and content
            // Name and chat content
            Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25,),
                Text(widget.name, style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18)),
                Text(widget.chat_text , style: TextStyle(color:SharedInfo.dark?Colors.white: Colors.black38),),

              ],
            ),

            Spacer(),
            widget.seen
                ? Icon(Icons.check_circle_outline_rounded ,size: 25,color: Colors.grey,)
                : Icon(Icons.radio_button_unchecked_rounded ,size: 25 ,color: Colors.grey,),
            SizedBox(width: 20,),
          ],

        ),
      ),
    );
  }
}
