import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final ImageProvider image;
  final double radius;
  final String name ;
   bool online;

  Avatar({
    required this.radius,
    required this.image,
    required this.name,
    this.online = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: radius,
              backgroundImage: image,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 5.0,
                  ),
                  shape: BoxShape.circle,
                  color: online ? Colors.green : Colors.grey,
                ),
              ),
            ),
          ],
        ),
        Text(name , style: TextStyle(color: Colors.black26),)
      ],
    );
  }
}
