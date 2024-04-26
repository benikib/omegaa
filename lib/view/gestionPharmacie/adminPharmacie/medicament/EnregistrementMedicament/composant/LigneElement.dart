import 'package:flutter/material.dart';




class LigneElement{
  List<Widget> elements;

  LigneElement(this.elements);

  lancer(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:this.elements,
    );

  }
}
