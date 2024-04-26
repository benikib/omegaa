import 'package:flutter/material.dart';


class ElementBlock {




  String element1;
  Widget element2;
 late Widget ?element3=Center();

  ElementBlock(this.element1,this.element2,{this.element3=null});

  Widget afficheElement(){
    return Container(

      child:Padding(
          padding: EdgeInsets.all(3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.element1,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              (this.element3==null)?Center():this.element3!,
              this.element2
            ],
          )
      ) ,
    )


    ;

  }


}