import 'package:flutter/material.dart';
import 'package:omegaa/view/auth/pageAuthentificationVendeur.dart';
import 'package:omegaa/view/pharmacie/pageEnregistrement.dart';
class ButtonConnection{

  String text;
  double espacement;
  Function f;
  ButtonConnection(this.text,this.espacement,this.f);
  lancer(){
    return Container(
      margin: EdgeInsets.only(top: this.espacement),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color.fromRGBO(50, 190, 166, 1)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: (){
          },
          child: Text(text)
      ),
    );
  }
}

