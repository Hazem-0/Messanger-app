import 'package:cx_task5/pages/chat.dart';
import 'package:flutter/material.dart';

import '../classes/shared_info.dart';
import '../data_provider/local/sqflite.dart';
import '../pages/contacts.dart';

class ContactBox extends StatefulWidget {

  int id ;
  String name;
  int index ;
  String phone;

  ContactBox({required this.id ,required this.index,required this.name, required this.phone});

  @override
  State<ContactBox> createState() => _ContactBoxState();
}

class _ContactBoxState extends State<ContactBox> {
  @override
  Sqflite sql = new Sqflite();

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
      },
      onLongPress: ()
      {
        {
          TextEditingController nameController =TextEditingController() ;
          TextEditingController phoneController =TextEditingController();
          nameController.text=widget.name;
          phoneController.text=widget.phone;
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (ctx) => Container(
                height: 500,
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
                        ])),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        TextField(

                          controller: nameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "New Name",
                            fillColor:(SharedInfo.dark) ?Colors.black:Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          keyboardType:TextInputType.phone,
                          controller: phoneController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: "New Phone",
                            fillColor: (SharedInfo.dark) ?Colors.black:Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            border: OutlineInputBorder(

                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () async{
                              int response = await sql.updateData('''
                                    UPDATE  "contacts" SET "name"="${nameController.text}","phone"="${phoneController.text}" 
                                    WHERE id="${widget.id}"
                                     '''
                              );
                              print( "updata respones =${response}");
                              // if(response>0)
                              Navigator.pushAndRemoveUntil(ctx, MaterialPageRoute(builder: (ctx)=>ContactPage() ),(route)=>false);
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,letterSpacing: 1),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStatePropertyAll<Color>(
                                  Color.fromRGBO(220, 100, 150, 0.65)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        }

      }
      ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

          width: double.infinity,
          height: 70,
          child: (Row(
            children: [
              CircleAvatar(
                backgroundColor: Color.fromRGBO(0,80, 255, 0.5),
                  child: Icon(Icons.person,size: 50,color:SharedInfo.dark?Colors.white: Color.fromRGBO(150, 50, 200, 0.8),),
                  radius: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Text
                        (
                        "${widget.name}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:SharedInfo.dark?Color.fromRGBO(255, 255, 255, 0.7): Color.fromRGBO(0, 0, 0, 0.55)),
                      ),
                    ),
                    Expanded(child:  Text
                      (
                      "${widget.phone}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:SharedInfo.dark?Color.fromRGBO(255, 255, 255, 0.7): Color.fromRGBO(0, 0, 0, 0.55)),
                    ),)
                  ],
                ),
              )

            ],
          )),
        ),
      ),
    );
  }
}
