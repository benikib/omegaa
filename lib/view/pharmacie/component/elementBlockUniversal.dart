import 'package:flutter/material.dart';


class ElementBlock1 {
  String  photo;
  String text;
 Function fonction;
 var context;
  ElementBlock1(this.photo,this.text,this.fonction,this.context);

  Widget afficheElement(){
    return InkWell(
      child: Container(
        child:
        Column(
          children: [
            Center(
              child:
              CircleAvatar(
                radius:35,
                backgroundColor: Color.fromRGBO(50, 190, 166, 1).withOpacity(0.1),
                backgroundImage: AssetImage(this.photo),
              ),
            ),
Center(
  child:   Text(
    this.text,
    style: TextStyle(
        color: Colors.black,
        fontSize: 16

    ),
  ) ,
)
          ],
        ) ,
      )
    ,onTap: (){
     fonction();
    },)  ;
  }
}