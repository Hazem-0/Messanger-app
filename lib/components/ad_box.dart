import 'package:cx_task5/classes/shared_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'avatar.dart';

class AdBox extends StatefulWidget {
  final ImageProvider img1;
  final ImageProvider img2;
  final String name;
  final String describtion;

  AdBox({
    required this.img1,
    required this.img2,
    required this.name,
    required this.describtion,
  });

  @override
  State<AdBox> createState() => _AdBoxState();
}

class _AdBoxState extends State<AdBox> {
  var Ad_icon = Container(
    decoration: BoxDecoration(
      color: Colors.black12,
      border: Border.all(color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    width: 27,
    height: 18,
    child: Center(
        child: Text(
      "Ad",
      style: TextStyle(
          fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white),
    )),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (SharedInfo.dark)?Colors.black:Colors.white,
        height: 110,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(image: widget.img1 , fit: BoxFit.cover),
                  color: (SharedInfo.dark)?Colors.white:Colors.black,
                  borderRadius: BorderRadius.circular(20)
              ),
              // child: widget.img2,
            ),
            SizedBox(
              width: 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      widget.name,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Ad_icon,
                  ],
                ),
                Text(widget.describtion),
                TextButton(
                    onPressed: () => null,
                    child: Text(
                      "View More",
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ),
            Spacer(),
            Container(
            margin: EdgeInsets.only(right: 10),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(image: widget.img2 , fit: BoxFit.cover),
                color: Colors.black,
                borderRadius: BorderRadius.circular(20)
              ),
              // child: widget.img2,
            ),

          ],
        ));
  }
}
