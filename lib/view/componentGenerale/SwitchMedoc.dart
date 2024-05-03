
import 'package:flutter/material.dart';



class SwitchMedoc{

  bool SwitchValue=false;
  Function f;

  SwitchMedoc({ required this.SwitchValue,required this.f});

  lancer(){

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text((this.SwitchValue==false)?"En pièce":"En paquet"),
        Switch(
            activeColor: Color.fromRGBO(50, 190, 166, 1),
            inactiveTrackColor: Colors.grey,
            inactiveThumbColor: Colors.black,
            value: this.SwitchValue,
            onChanged: ((b){
              this.f(b);
            }))
      ],
    );

  }
}