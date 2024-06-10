import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/friend_request.dart';
import '../classes/shared_info.dart';

class FriendRequest extends StatefulWidget {
  final ImageProvider img;
  final String name;

  FriendRequest({required this.img,required this.name});

  @override
  State<FriendRequest> createState() => _FriendRequestState();
}

class _FriendRequestState extends State<FriendRequest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(      color: Color.fromRGBO(0, 0, 0, 0.04),
      ),
      margin: EdgeInsets.symmetric( vertical: 10),
      height: 100,
      child: Row(
        children: [

          Container(

            child: Column(
              children: [
                Text("swipe"),
                Icon(Icons.arrow_forward , size: 35),
                Text("reject"),
              ],
            ),
            width: 80,
            // height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
              color: Colors.redAccent,
              // borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            backgroundImage: widget.img,
          ),
          SizedBox(width: 20,),
          Text(
            widget.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          // ElevatedButton(
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStatePropertyAll<Color>(Colors.greenAccent),
          //     foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
          //   ),
          //   onPressed: () => null,
          //   child: Icon(
          //     Icons.check,
          //   ),
          // ),
          Container(
            width: 80,
            height: 100,
            child: Column(
              children: [
                Text("swipe"),
                Icon(Icons.arrow_back , size: 35,),
                Text("accept"),

              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),

              color: Colors.greenAccent,
              // borderRadius: BorderRadius.circular(15),
            ),
          ),

        ],
      ),
    );
  }
}
