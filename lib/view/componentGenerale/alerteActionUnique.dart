import 'package:flutter/material.dart';

import 'ButtonCostom.dart';
import 'InputCostom.dart';




class AlertActionUnique{
  Function actionPourOui;

  var context,Title,contenue;

  AlertActionUnique(this.actionPourOui,this.context,this.contenue,this.Title);
  lancer(){
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Title),
          content:
                Text(contenue,style: TextStyle(
                    fontSize: 20
                ),),

          actions: [
            ButtonCostom("fermer", Colors.red, (){
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