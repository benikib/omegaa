import 'package:flutter/material.dart';


class BlockVenteUniversal {

  List<Widget> listElement=[];
  late Widget vente=Image.asset("imagess/ajouterPanier.png",width: 100,height: 100,);

  BlockVenteUniversal( this.listElement);

  Card createBlockUniversal(double taille){
    return Card(
        child: Padding(
          padding: EdgeInsets.all(8),
          child:
          Container(
              height: 400,
              width:taille-60,
              child:
              Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.green,
                      )
                    ],
                  )
                      )

              )
          ),

    );
  }







}






