import 'package:cx_task5/components/avatar.dart';
import 'package:cx_task5/components/chat_box.dart';
import 'package:cx_task5/components/home_appbar.dart';
import 'package:cx_task5/pages/archive.dart';
import 'package:cx_task5/pages/friends.dart';
import 'package:flutter/material.dart';
import 'package:cx_task5/classes/shared_info.dart';
import '../data_provider/local/shared_preferences.dart';
import 'ongoingChats.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {



  void loadUserData() async {
    SharedInfo.activeUser["username"] =
        await StoreSimpleData.getItem(key: "username", type: "String") ?? "hazem@kora.com";
    SharedInfo.activeUser["name"] =
        await StoreSimpleData.getItem(key: "name", type: "String") ?? "Hazem";
    SharedInfo.activeUser["phone"] =
        await StoreSimpleData.getItem(key: "phone", type: "String") ?? "01013608519";
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserData();
  }

  @override
  String screenName = 'Chat';
  int selected_page = 0;

  void selectPage(int index) {
    setState(() {
      selected_page = index;
    });
  }

  Widget build(BuildContext context) {
    Widget activePage = Chat();
    if (selected_page == 0) {
      activePage = Chat();
      screenName = 'Chat';
      setState(() {});
    } else if (selected_page == 1) {
      activePage = FriendsPage();
      screenName = 'Requests';
      setState(() {});
    } else if (selected_page == 2) {
      activePage = ArchivePage();
      screenName = "Archived";
      setState(() {});
    }

    return SafeArea(

      child: Scaffold(
        backgroundColor: SharedInfo.dark?Colors.black:Colors.white,
        body: Column(
          children: [
            HomeAppBar(
              pageIndex: true,
              contact_chat: Icon(Icons.edit_square , size: 30,),
              name: screenName,
              img: AssetImage("assets/imgs/profile.webp"),
            ),
            activePage,
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          currentIndex: selected_page,
          selectedItemColor:(SharedInfo.dark)?Colors.white: Colors.black,
          unselectedItemColor: Colors.black26,
          iconSize: 35,
          backgroundColor:(SharedInfo.dark)?Color.fromRGBO(
              235, 217, 248, 0.8156862745098039):
          Color.fromRGBO(227, 235, 255, 0.4235294117647059)
              ,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.archive),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
