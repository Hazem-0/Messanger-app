import 'package:cx_task5/data_provider/local/sqflite.dart';
import 'package:cx_task5/pages/contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../classes/shared_info.dart';

class ContactButton extends StatefulWidget {
  @override
  final int id;

  final Icon icon;

  final Icon icon2;

  final String name;

  ContactButton(
      {required this.id,
      required this.icon,
      required this.name,
      required this.icon2});

  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  Color color3 = Colors.blue;

  Color color2 = Colors.purple;

  Color color1 = Colors.deepOrangeAccent;

  Sqflite sql =new Sqflite();

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (widget.id == 1)
          {
            TextEditingController nameController =TextEditingController() ;
            TextEditingController phoneController =TextEditingController();
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
                                  hintText: "Name",
                                  fillColor: SharedInfo.dark?Colors.black: Colors.white,
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
                                  hintText: "Phone",
                                  fillColor:SharedInfo.dark?Colors.black: Colors.white,
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
                                    int response = await sql.insertData('''
                                    INSERT  INTO "contacts" ( "uid","name" , "phone")
                                    VALUES ( "${SharedInfo.activeUser["username"]}","${nameController.text}","${phoneController.text}")
                                     '''
                                    );
                                    print( response);
                                  if(response>0)
                                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ContactPage() ),(route)=>false);
                                  },
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                        color: SharedInfo.dark?Colors.black: Colors.white,
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
          else if (widget.id==0)
            {

              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (ctx) => Container(
                    height: 450,
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
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Group Name",
                                fillColor: SharedInfo.dark?Colors.black: Colors.white,
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
                                onPressed: () => null,
                                child: Text(
                                  "Create",
                                  style: TextStyle(
                                      color: SharedInfo.dark?Colors.black: Colors.white,
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
          else if (widget.id==2)
          {

            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (ctx) => Container(
                  height: 450,
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
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Community Name",
                              fillColor: SharedInfo.dark?Colors.black: Colors.white,
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
                              onPressed: () => null,
                              child: Text(
                                "Create",
                                style: TextStyle(
                                    color: SharedInfo.dark?Colors.black: Colors.white,
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
        },
        child: Container(
          width: double.infinity,
          height: 50,
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                child: widget.icon,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      color1,
                      color2,
                      color3,
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  widget.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              IconButton(onPressed: () => null, icon: widget.icon2)
            ],
          ),
        ),
      ),
    );
  }



}
