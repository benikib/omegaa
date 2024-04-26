
import 'package:flutter/material.dart';

import 'ButtonCostom.dart';

class AlertDialogue{
  var Title,contenue;
  List<Widget> action;
  Function ?fonctionExte;

  AlertDialogue({this.Title,this.contenue,required this.action,this.fonctionExte=null});

 Future lancer(context){
   return
     showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
           title: Text(Title),
           content: Text(contenue,style: TextStyle(
               fontSize: 15
           )),
           actions: action,
         );
       },
     ).then((value) {
       if (fonctionExte != null) {
         fonctionExte!();
       }
     })

     ;
 }






}