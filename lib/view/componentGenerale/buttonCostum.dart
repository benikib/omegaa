import 'package:flutter/material.dart';
class ButtonCostum{

  String text;
  Function f;
  ButtonCostum(this.text,this.f);
  lancer(){
   return TextButton(
      onPressed: () {
        this.f();
      },
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(color: Colors.white), // Couleur du texte du bouton
        ),
      ),
      child: Text(text),
    );
  }
}