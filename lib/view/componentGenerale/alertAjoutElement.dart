import 'package:flutter/material.dart';

import 'ButtonCostom.dart';
import 'InputCostom.dart';




class AlertAjoutElement{
  Function actionPourOui;
  Function actionPourNon;
  var context,Title,contenue;
  var avecTextFiel=false;
  Function nomClient;

  AlertAjoutElement(this.actionPourOui,this.actionPourNon,this.context,this.contenue,this.Title,{required this.nomClient,this.avecTextFiel=false});
  lancer(){
   return showDialog(
     context: context,
     builder: (BuildContext context) {
       return AlertDialog(
         title: Text(Title),
         content:Container(
           height: 80,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(contenue,style: TextStyle(
                    fontSize: 15
                ),),
                (this.avecTextFiel)?
                InputCostom(Name:"nomClien",value: "Entrer le nom du client...",couleur:Color.fromRGBO(228, 228, 228,1 ),lar:30,long:250,elevation: 1).lancer():
                Center(),
              ],
            )  ,
                     ) ,
         actions: [
         ButtonCostom("Non", Colors.red, (){
         actionPourNon();
       }).lancer(),
           ButtonCostom("Oui", Color.fromRGBO(50, 190, 166, 1), (){
             actionPourOui();
           }).lancer()

         ],
       );
     },
   ).then((value) {
   })

   ;
  }
}