import 'package:cx_task5/classes/shared_info.dart';
import 'package:cx_task5/components/contact_box.dart';
import 'package:cx_task5/components/contact_button.dart';
import 'package:cx_task5/components/home_appbar.dart';
import 'package:cx_task5/data_provider/local/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override

  Sqflite sql =new Sqflite();
  List contacts =[];

  int id =0;
   contactsReader()async
  {
    List response1 = await sql.readData('SELECT * from contacts WHERE uid="${SharedInfo.activeUser["username"]}" ');
    List response2 = await sql.readData("SELECT * from user ");

    print("response2 = ${response2}");
    print("response1 =${response1}");
    contacts.addAll(response1);
    setState(() {

    });

  }
  @override
  void initState() {
    // TODO: implement initState
    contactsReader();

    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeAppBar(
              img: AssetImage("assets/imgs/profile.webp"),
              name: "Contact",
              contact_chat: Icon(
                Icons.chat_outlined,
                size: 30,
              ),
              pageIndex: false,
            ),
            SizedBox(
              height: 30,
            ),
            ContactButton(
              id:0,
              icon2: Icon(null),
              name: "New group",
              icon: Icon(
                Icons.group_add_outlined,
                size: 25,
                color: Colors.white,
              ),
            ),
            ContactButton(
              id:1,
              icon2: Icon(Icons.qr_code),
              name: "New Contact",
              icon: Icon(
                Icons.group_add_outlined,
                size: 25,
                color: Colors.white,
              ),
            ),
            ContactButton(
              id: 2,
              icon2: Icon(null),
              name: "New Community",
              icon: Icon(
                Icons.group_add_outlined,
                size: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Contacts on Messanger" , style: TextStyle(fontWeight: FontWeight.w700,fontSize: 21,color:SharedInfo.dark?Color.fromRGBO(255, 255, 255, 0.5): Color.fromRGBO(0, 0, 0, 0.5)),),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: (contacts.isEmpty)?Center(child: Text("No Contacts",style: TextStyle(fontSize: 20),),):ListView.builder(
                itemCount:contacts.length,
                itemBuilder: (context, index) {
                  return Slidable(
                      endActionPane: ActionPane(
                        motion:  StretchMotion(),
                          children: [
                          SlidableAction(
                          onPressed: (context)async {
                            int response =await sql.deleteData(''' 
                            DELETE FROM  "contacts" WHERE id= "${contacts[index]["id"] }"
                            ''');
                            print("delete response =${response}");
                            setState(() {
                              contacts.removeAt(index);
                            });
                          },
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  ),
                          ],
                      ),
                      startActionPane: ActionPane(
                        motion:  StretchMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context){
                              {
                                TextEditingController nameController =TextEditingController() ;
                                TextEditingController phoneController =TextEditingController();
                                nameController.text=contacts[index]["name"];
                                phoneController.text=contacts[index]["phone"];
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
                                                  fillColor: (SharedInfo.dark) ?Colors.black:Colors.white,
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
                                                  fillColor:(SharedInfo.dark) ?Colors.black:Colors.white,
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
                                    WHERE id="${contacts[index]["id"]}"
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

                            },
                            icon: Icons.edit,
                            backgroundColor: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ],
                      ),
                      child: ContactBox(index: index , name: contacts[index]["name"],phone: contacts[index]["phone"],id: contacts[index]["id"],));
                },
              ),
            ),

            // ContactBox( name: "Hazem Abdelraouf",phone: "01013608519",),
            // ContactBox(name: "Hafez Alaa",phone: "01013608519",),
            // ContactBox(name: "Hassan Mahmoud",phone: "01013608519",),
            // ContactBox(name: "Ziad Swera",phone: "01013608519",),
            // ContactBox(name: "ALi Ayman",phone: "01013608519",),
            // ContactBox(name: "Walid karem",phone: "01013608519",),

          ],
        ),
      ),
    );
  }
}
