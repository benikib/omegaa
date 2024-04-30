

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MessageFlache{

  String message="";


  int temps= 2;
  ToastGravity position=ToastGravity.BOTTOM;
  MessageFlache({required String message,temps=2, position=ToastGravity.BOTTOM}){
    this.message=message;
    lancer();
  }

  lancer(){
    print("fluttertoas");
     Fluttertoast.showToast(
        msg: this.message,
        toastLength: Toast.LENGTH_SHORT,

        timeInSecForIosWeb: 2,
        gravity: position,

        backgroundColor: Colors.blueGrey,
        fontSize: 16.0);
  }



}