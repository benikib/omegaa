import 'dart:ffi';

import 'package:flutter/material.dart';

class VenteBlock extends StatefulWidget {
  late String numeroVente;
  late String nomProp;
  late String heure;
  late String montant="";
  late Widget contenue;
  VenteBlock({required this.numeroVente,required this.nomProp, required this.heure,required this.contenue,this.montant=""});
  @override
  State<VenteBlock> createState() =>StateVenteBlock(this.numeroVente,this.nomProp,this.heure,this.contenue,montant: this.montant);
}

class StateVenteBlock extends State<VenteBlock> {

  late String numeroVente;
  late String nomProp;
  late String montant="";
  late String heure;
  late bool visible=false;
  late int veri=0;
  late Widget contenue;
  late double taille=0;
  late String deroulant="imagess/ouv.png";
  StateVenteBlock(this.numeroVente,this.nomProp,  this.heure,this.contenue,{this.montant=""});

  @override
  Widget build(BuildContext context) {

    return Padding(padding: EdgeInsets.only(top: 15,bottom: 15),
        child:Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child:Visibility(
                    visible: visible,
            child: Container(
              width:MediaQuery.of(context).size.width-88 ,
              margin:EdgeInsets.only(top:70),
              child: contenue,
            ),
        ),
                    width:MediaQuery.of(context).size.width-88,
                    height: this.taille,
                    decoration:BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 7,
                          ),
                        ],

                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    )
                )
              ],
            )
            ,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width:MediaQuery.of(context).size.width-60 ,
                  height: 65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width:MediaQuery.of(context).size.width-249,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Vente N° "+numeroVente,style: TextStyle(fontSize: 15,color: Colors.black)),
                            Text("Nom: "+nomProp,style: TextStyle(fontSize: 15,color: Colors.black),),
                          ],
                        ),
                      )
                      ,
                      Container(
                        height: 50,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(heure,style: TextStyle(fontSize: 14,color: Colors.red),),
                            Text("Montant: $montant",style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                            ))
                          ],
                        ),
                      )

                     ,
                      InkWell(
                        child: Image.asset(this.deroulant,width: 28,color:Color.fromRGBO(50, 190, 166, 1) ,) ,
                        onTap: (){
                          setState((){
                            if(veri==0){
                              this.deroulant="imagess/ferme.png";
                              this.taille=300 ;
                              visible=true;
                              veri=1;
                            }else{
                              visible=false;
                              this.deroulant="imagess/ouv.png";
                              this.taille=0;
                              veri=0;
                            }


                          });

                        },
                      )
                    ],
                  ),
                  decoration:BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 7,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),

                )

              ],
            )
            ,
          ],

        )) ;
  }
verifiStatut(){
    if(veri==0){
      return Text("");
    }else{
      return this.contenue;
    }
}






}

