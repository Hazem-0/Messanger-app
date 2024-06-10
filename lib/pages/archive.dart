import 'package:cx_task5/classes/shared_info.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class ArchivePage extends StatefulWidget {


  @override
  State<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: (SharedInfo.archived_list.isEmpty)?Center(child: Text("No Archived Chats",style: TextStyle( fontSize: 20),),):Container(
        margin: EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: SharedInfo.archived_list.length,
          itemBuilder: (context, index) {


            return Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                int id=SharedInfo.archived_list[index].item2;
                SharedInfo.chat_list[id]= Tuple2(SharedInfo.archived_list[index].item1, id);
                SharedInfo.archived_list.removeAt(index);
                setState(() {

                });
                ScaffoldMessenger.of(context).showSnackBar(

                  SnackBar(
                    duration: Duration(milliseconds: 500),
                    content: Text('Deleted'),backgroundColor: Colors.red,),
                );
              },
              child:  SharedInfo.archived_list[index].item1,
            );
          },
        ),
      ),
    );
  }
}
