

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MessageFlache{
  String message;

  MessageFlache({required this.message});
  lancer(){
    return Fluttertoast.showToast(
        msg: this.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.blueGrey,
        fontSize: 16.0
    );
  }



}