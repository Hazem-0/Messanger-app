import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../components/avatar.dart';
import '../components/chat_box.dart';
import '../components/friend_request.dart';

class SharedInfo extends ChangeNotifier
{

  static List<Tuple2<Widget,int >> chat_list = [
    Tuple2(ChatBox(
      person_avatar: Avatar(
        image: AssetImage("assets/imgs/f6.png"),
        name: "",
        online: true,
        radius: 45,
      ),
      name: "Martin Randolph",
      chat_text: """You: What’s man! · 9:40 AM""",
      seen: true,
      date: "date",
    ), 0),
    Tuple2(ChatBox(
      person_avatar: Avatar(
        image: AssetImage("assets/imgs/f7.png"),
        name: "",
        online: false,
        radius: 45,
      ),
      name: "Andrew Parker",
      chat_text: """You: Ok, thanks! · 9:25 AM""",
      seen: true,
      date: "date",
    ), 1),
    Tuple2(ChatBox(
      person_avatar: Avatar(
        image: AssetImage("assets/imgs/f8.png"),
        name: "",
        online: false,
        radius: 45,
      ),
      name: "Karen Castillo",
      chat_text: """You: Ok, See you in To… · Fri""",
      seen: true,
      date: "date",
    ), 2),
    Tuple2(ChatBox(
      person_avatar: Avatar(
        image: AssetImage("assets/imgs/f9.png"),
        name: "",
        online: true,
        radius: 45,
      ),
      name: "Maisy Humphrey",
      chat_text: """Have a good day, Maisy! · Fri""",
      seen: true,
      date: "date",
    ), 3),
    Tuple2(ChatBox(
      person_avatar: Avatar(
        image: AssetImage("assets/imgs/f10.png"),
        name: "",
        online: false,
        radius: 45,
      ),
      name: "Joshua Lawrence",
      chat_text: """The business plan loo…  · Thu""",
      seen: false,
      date: "date",
    ), 4)
  ];
  static List <Tuple2<Widget,int>> archived_list=[];

  static List<Widget> friends=[
    FriendRequest(img: AssetImage("assets/imgs/f2.webp"), name: "ana nfady"),
    FriendRequest(img: AssetImage("assets/imgs/hh.webp"), name: "Little king"),
    FriendRequest(img: AssetImage("assets/imgs/f1.webp"), name: "cono"),
    FriendRequest(img: AssetImage("assets/imgs/f3.webp"), name: "catdog"),
    FriendRequest(img: AssetImage("assets/imgs/f4.webp"), name: "T_H"),
  ];
  static bool dark=false;
  static bool status=true;
  static bool logged =false ;
  static late Map activeUser={"username":"hazem@kora.com" ,"phone":"01013608519","name":"Hazem"} ;

}