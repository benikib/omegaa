import 'package:flutter/material.dart';


blockInt(Widget element1,Widget element2,List<Widget> elementSup){
  return
    Container(
    height: 180,
    child:Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        element1,
        Container(
          height: 100,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              element2,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: elementSup,
              )
            ],
          ) ,
        )

      ],
    ) ,
  ) ;
}