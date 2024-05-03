import 'package:flutter/material.dart';



class InputRecherche{

  var context;
  String textArecchercher="";
Function f;
  String valeurPropre="";
  String valeurInterne;
  double long,larg;
  FocusNode focus=FocusNode();
  InputRecherche(this.context,this.f,{this.long=200,this.larg=20,this.valeurInterne=""});

  lancer(){

    return  Container(

      margin: EdgeInsets.only(top: 10),
      height: this.larg,
      width: this.long,
      // color: Colors.red,
      child:Theme(
        data: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 6),
              hintStyle: TextStyle(color: Colors.black),
            )
        ),
        child:TextField(
          focusNode: focus,
          controller: TextEditingController(text:valeurInterne ),
          onChanged: (z){
            this.valeurPropre=z;
          },
          keyboardType:TextInputType.name,
          style: TextStyle(

            fontSize: 12,
            // height: 1.0
          ),
          decoration: InputDecoration(
            prefixIcon: InkWell(child:Icon(Icons.search),onTap: (){

              this.f(valeurPropre);

            },),
            hintText:"Recheche...",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))
            ),
          ),
        ) ,
      ) ,
    );
  }


}