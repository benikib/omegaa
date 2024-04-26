
import 'package:flutter/material.dart';

Elemt( String text,Function f){
  return InkWell(
    child:Text(text,style: TextStyle(color: Colors.blue)) ,
    onTap: (){
      f();
    },
  );
}