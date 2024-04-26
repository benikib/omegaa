import 'package:flutter/material.dart';





class SwitchCostum{

  Color couleurActive;
  Color couleurDesactive ;
  bool value;
  Function f;

  SwitchCostum({required this.couleurActive,required this.couleurDesactive,required this.value,required this.f});


  lancer(){
    return Switch(
        activeColor: couleurActive,
        inactiveTrackColor: couleurDesactive,
        inactiveThumbColor: couleurDesactive,
        value: value,
        onChanged: ((bool) {
        f(bool);
        }));
  }





}