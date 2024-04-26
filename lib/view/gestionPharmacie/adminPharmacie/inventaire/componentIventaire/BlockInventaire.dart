import 'dart:ffi';

import 'package:flutter/material.dart';

class BlockInventaire {

  late String inventaire="";
  Function action;
  late double larg,long;
  late double taille=0;
  late String deroulant="imagess/passer.png";
  BlockInventaire({required this.inventaire, required this.action,required this.long,required this.larg});

  Widget lancer() {
    return InkWell(
      onTap: (){
        this.action();
      },
      child: Container(
        width: this.long.toDouble(),
        height: this.larg.toDouble(),
        decoration: BoxDecoration(
            color: Color.fromRGBO(50, 190, 166, 1),

            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(2,2),
                  blurRadius: 4

              )

            ]
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(this.inventaire,style: TextStyle(
                color: Colors.white,
                fontSize: 18
            )

              ,),
            Image.asset(this.deroulant,width: 20,color: Colors.white,) ,

          ],
        ),
      ),
    ) ;
  }
 // Text(inventaire,style: TextStyle(fontSize: 17,color: Colors.black)),






}

