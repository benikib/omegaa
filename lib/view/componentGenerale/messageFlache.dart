

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MessageFlache{
<<<<<<< HEAD
  String message;
  MessageFlache({required this.message});
=======
  String message="";
  int temps= 2;
  ToastGravity position=ToastGravity.BOTTOM;
  MessageFlache({required String message,temps=2, position=ToastGravity.BOTTOM}){
    this.message=message;
    lancer();
  }

>>>>>>> 70d15b3304d423e159cdf70414a8c5d72cb2ba70
  lancer(){
    print("fluttertoas");
     Fluttertoast.showToast(
        msg: this.message,
        toastLength: Toast.LENGTH_SHORT,
<<<<<<< HEAD
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
=======
        gravity: position,
        timeInSecForIosWeb: this.temps ,
>>>>>>> 70d15b3304d423e159cdf70414a8c5d72cb2ba70
        backgroundColor: Colors.blueGrey,
        fontSize: 16.0);
  }



}