import 'package:cx_task5/components/ad_box.dart';
import 'package:cx_task5/components/chat_box.dart';
import 'package:cx_task5/components/settings_button.dart';
import 'package:cx_task5/pages/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cx_task5/classes/shared_info.dart';
import 'package:tuple/tuple.dart';
import '../components/avatar.dart';
import '../components/home_appbar.dart';

class Chat extends StatefulWidget {

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  
  void delete_chatbox(int index)
  {
    setState(() {
      SharedInfo.chat_list.removeAt(index);

    });
  }

  void archive_chatbox(Widget value , int index)
  {

      SharedInfo.archived_list.remove(Tuple2(value, index));
      SharedInfo.archived_list.add(Tuple2(value, index));
    setState(() {

    });
  }





  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        child: Stack(
          children: [
            Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: SharedInfo.dark?Color.fromRGBO(255, 255, 255, 0.1):Color.fromRGBO(0, 0, 0, 0.04),
                      prefixIcon: Icon(
                        Icons.search,
                        color:SharedInfo.dark? Colors.white:Colors.black26,
                        size: 30,
                      ),
                      labelText: 'Search',
                      labelStyle: TextStyle(color:SharedInfo.dark?Colors.white: Colors.black26),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          width: 0,
                          color:SharedInfo.dark?Colors.white: Colors.transparent,
                        ),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(width: 20),
                      Column(
                        children: [
                          InkWell(
                            onTap: () => null,
                            child: CircleAvatar(
                              child: Icon(Icons.add, size: 40,color: SharedInfo.dark?Colors.black:Colors.white,),
                              backgroundColor:SharedInfo.dark?Colors.white: Color.fromRGBO(0, 0, 0, 0.04),
                              radius: 45,
                            ),
                          ),
                          Text(
                            "Your Story",
                            style: TextStyle(color: Colors.black26),
                          ),
                        ],
                      ),
                      SizedBox(width: 15),
                        Avatar(
                          image: AssetImage("assets/imgs/f6.png"),
                          name: "Martin",
                          online: true,
                          radius: 45,
                        ),
                      SizedBox(width: 15),

                      Avatar(
                        image: AssetImage("assets/imgs/f8.png"),
                        name: "Karen",
                        online: true,
                        radius: 45,
                      ),
                      SizedBox(width: 15),

                      Avatar(
                        image: AssetImage("assets/imgs/f9.png"),
                        name: "Maisy",
                        online: true,
                        radius: 45,
                      ),
                      SizedBox(width: 15),

                    ],
                  ),
                ),
                Expanded(
                  child:(SharedInfo.chat_list.isEmpty)?Center(child: Text("No Chats",style:TextStyle(fontSize: 20) ,),):
                  ListView.builder(
                    itemCount: SharedInfo.chat_list.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        startActionPane: ActionPane(
                          motion: const DrawerMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) => null,
                              icon: Icons.camera_alt_rounded,
                              backgroundColor: Color.fromRGBO(0, 132, 254, 1),
                              borderRadius: BorderRadius.circular(100),
                              foregroundColor:Colors.white,),
                            SlidableAction(
                              onPressed: (context) => null,
                              icon: Icons.phone,
                              backgroundColor: SharedInfo.dark?Color.fromRGBO(255, 255, 255, 0.1): Color.fromRGBO(0, 0, 0, 0.04),
                              borderRadius: BorderRadius.circular(100),
                              foregroundColor:Colors.white,                            ),
                            SlidableAction(
                              onPressed: (context) => null,
                              icon: Icons.videocam,

                              backgroundColor:SharedInfo.dark?Color.fromRGBO(255, 255, 255, 0.1): Color.fromRGBO(0, 0, 0, 0.04),
                              borderRadius: BorderRadius.circular(100),
                              foregroundColor:Colors.white,
                            ),
                          ],
                        ),
                        endActionPane: ActionPane(
                          motion: const DrawerMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) { archive_chatbox(SharedInfo.chat_list[index].item1,SharedInfo.chat_list[index].item2) ;SharedInfo.chat_list[index]=Tuple2(SizedBox(height: 0,), SharedInfo.chat_list[index].item2) ;},
                              icon: Icons.archive,
                              backgroundColor:SharedInfo.dark?Color.fromRGBO(255, 255, 255, 0.1): Color.fromRGBO(0, 0, 0, 0.04),
                              borderRadius: BorderRadius.circular(100),
                              foregroundColor:Colors.white, ),
                            SlidableAction(
                              onPressed: (context) => null,
                              icon: Icons.block,
                              backgroundColor: SharedInfo.dark?Color.fromRGBO(255, 255, 255, 0.1): Color.fromRGBO(0, 0, 0, 0.04),
                              borderRadius: BorderRadius.circular(100),
                              foregroundColor:Colors.white,),
                            SlidableAction(
                              onPressed: (context) => delete_chatbox(index),
                              icon: Icons.delete,
                              backgroundColor: Color.fromRGBO(254, 41, 77, 1),
                              borderRadius: BorderRadius.circular(100),
                              foregroundColor:Colors.white,),
                          ],
                        ),
                        child: SharedInfo.chat_list[index].item1,
                      );
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AdBox(
                img1: AssetImage("assets/imgs/oval.png",),
                img2: AssetImage("assets/imgs/rectangle.png",),
                name: "Pixsellz",
                describtion: "Make design process easier…",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
