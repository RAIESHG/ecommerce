import 'package:another_flushbar/flushbar.dart';
import  'package:flutter/material.dart';


class MessageBox{


  Widget Display(BuildContext context,String title,String message,Color color){
    return Flushbar(
      backgroundColor: color,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      title: title,
      message: message,
      duration: Duration(seconds: 6),
      margin: EdgeInsets.all(8),

      blockBackgroundInteraction: true,
      dismissDirection:
      FlushbarDismissDirection.VERTICAL,
    )..show(context);
  }
}