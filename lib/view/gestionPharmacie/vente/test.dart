import 'dart:ffi';

import 'package:flutter/material.dart';

class Venteteste extends StatefulWidget {
  @override
  State<Venteteste> createState() =>VenteBlock();
}

class VenteBlock extends State<Venteteste> {
  late String numeroVente ="5";
  late String nomProp="manima";
  late String heure="20h 30min";
  late int veri=0;
  late String contenue="kedal";
  late double taille=0;
  late String deroulant="imagess/ouv.png";

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 15,bottom: 15),
        child:Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                        height: 40,
                        width:MediaQuery.of(context).size.width-249  ,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Vente N° "+numeroVente,style: TextStyle(fontSize: 17,color: Colors.black)),
                            Text("Nom:"+nomProp,style: TextStyle(fontSize: 17,color: Colors.black),),
                          ],
                        ),
                      )
                      ,Text(heure,style: TextStyle(fontSize: 14,color: Colors.red),),
                      InkWell(
                        child: Image.asset(this.deroulant,width: 28,color:Color.fromRGBO(50, 190, 166, 1) ,) ,
                        onTap: (){
                          setState((){
                            if(veri==0){
                              this.deroulant="imagess/ferme.png";
                              this.taille=300 ;
                              veri=1;
                            }else{
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





}

