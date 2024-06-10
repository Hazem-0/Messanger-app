import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class lsButton extends StatefulWidget {
  final Function  myFunction;
  final String button_name;
   lsButton({required this.myFunction , required this.button_name});

  @override
  State<lsButton> createState() => _lsButtonState();
}

class _lsButtonState extends State<lsButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: widget.myFunction(context), child: Text(widget.button_name));
  }
}
