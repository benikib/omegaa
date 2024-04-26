import 'package:flutter/material.dart';




class BlockElement{
  List<Widget> elements;

  BlockElement(this.elements);

  lancer(){
    return Container(


    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Text("Enregistrement de Produits ", style: TextStyle(
    fontSize: 22,
      fontWeight: FontWeight.bold
    ),) ,
    Container(

    height: 350,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children:this.elements
    ),
    )]
    ));

  }
}


