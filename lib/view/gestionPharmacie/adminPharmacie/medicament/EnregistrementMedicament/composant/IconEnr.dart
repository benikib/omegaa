import 'package:flutter/material.dart';
IconEnr(width,IconData ic){
  return  InkWell(
    child:Container(
      width: 80,
      child: Center(
        child:Icon(ic,color:Color.fromRGBO(50, 190, 166, 1) ,) ,
      ) ,
    ) ,
    onTap: (){
    },
  );
}