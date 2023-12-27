

import 'package:flutter/material.dart';

class CalButton extends StatelessWidget {
String btnValue;
Color txtcolor;
Color   btncolor;
VoidCallback onpress;

 CalButton({
  required this.btnValue,
  required this.btncolor,
  required this.onpress,
  required this.txtcolor,

 });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
         onTap: onpress,
         child: Container(
          height:  70,
         width:  70,
         decoration:  BoxDecoration(
          color: btncolor,
          shape: BoxShape.circle,
         ),
         child: Center(
          child: Text(btnValue,style: TextStyle(fontSize: 30, color:txtcolor),),
         ),

         ),
    );
  }
}