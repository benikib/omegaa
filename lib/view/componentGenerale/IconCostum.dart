import 'package:flutter/material.dart';
class IconCostum {
  Function f;
  double taille=0.0;
  IconData iconInterne;

  IconCostum({required this.f, required this.taille, required this.iconInterne});

  lancer(){
    return  InkWell(onTap:(){
      this.f();
    },
      child:Container(
        width: this.taille,
        child:Icon(
          iconInterne,
        ) ,
      )  ,
    );

  }

}