import 'package:flutter/material.dart';

import 'InputRecherche.dart';


class BlockVente {

  Widget zoneRecherche ;

  List<Widget> listElement=[];
  Function fonction;



  late Widget vente=Image.asset("imagess/ajouterPanier.png",width: 50,height: 50,);

  BlockVente( this.listElement,this.fonction,this.zoneRecherche);

  Container createBlock(double taille){
    return Container(
        height: 350,
        width:taille-60,
        child:
        Padding(
            padding: EdgeInsets.all(5),
            child:
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  this.zoneRecherche
                  ,
                 Container(
                   child:  Padding(
                     child: Column(
                       mainAxisSize: MainAxisSize.max,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: this.listElement,
                     ),
                     padding: EdgeInsets.only(left:5,right: 5),
                   ) ,
                 )
                  ,
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            fonction();
                          },
                          child:this.vente,
                        )
                      ],
                    ),
                  ),
                ])
        )
    );
  }







}






