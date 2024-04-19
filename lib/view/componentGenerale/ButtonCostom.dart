import 'package:flutter/material.dart';
class ButtonCostom{

  String text;

  Color font;
  var mt,mb,ml,mr;
  Function fonction;
  var taille;
  double rad;

  ButtonCostom(this.text,this.font,this.fonction,{this.taille=10,this.mt=0,this.mb=0,this.ml=0,this.mr=0,this.rad=5});
  lancer(){
    return  InkWell(
      child:Container(
          margin: EdgeInsets.only(
              top: mt.toDouble(),
              bottom: mb.toDouble(),
              left: ml.toDouble(),
              right:mr.toDouble()
          ),
          child:Padding(
            child:Text(text,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white
              ),
            ) ,
            padding: EdgeInsets.only(
                top:taille.toDouble(),bottom: taille.toDouble(),left: (taille+23).toDouble(),right:(taille+23).toDouble()
            ),
          )
          ,
          decoration:BoxDecoration(
              color: font,
              borderRadius: BorderRadius.all(Radius.circular(this.rad))
          )
      ) ,
      onTap: (){
        fonction();
      },
    );
  }
}