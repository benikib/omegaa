import 'package:flutter/material.dart';


class ElementBlock {

 List <Widget> elements;

  ElementBlock({ required this.elements});

  Widget afficheElement(){
    return Container(

      child:Padding(
          padding: EdgeInsets.all(3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: this.elements,
          )
      ) ,
    )


    ;

  }


}