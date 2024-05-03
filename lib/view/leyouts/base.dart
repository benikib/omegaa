import 'package:flutter/material.dart';

class Base {
  late Widget content;
  late double taille=400;
  late List <Widget>child=[];
   void remplissage(List <Widget>val){
     int i;
    this.child.addAll(val);}

  Base({content,required List<Widget>child}){
     child.add(Center());
    this.content=content;
    remplissage(child);
  }
//limite de la taille 350
  Widget lancer(double tailleBlock,double tailleBlock2) {
     var v=this.child;

   this.child= [
      Container(

        child: Image.asset(
          "imagess/logoOmegaPharma.png",
          width: 100,
        ),
      ),
      Card(

          margin: EdgeInsets.only(top: 15),
          child:SingleChildScrollView(

    child: Padding(
        padding: EdgeInsets.all(2),
        child: Container(
          height: tailleBlock,
          width: tailleBlock2,
          child: this.content,
        )) ,
    ))
    ];
   this.child+=v;
    return Stack(alignment: AlignmentDirectional.topCenter, children: [
      Container(height: 145, color: Color.fromRGBO(50, 190, 166, 1)),
      SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top:11),
              height: 660,

              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: this.child)
          ))
    ]);
  }
}
