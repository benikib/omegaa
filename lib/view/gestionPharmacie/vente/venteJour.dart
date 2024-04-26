import 'package:flutter/material.dart';
import 'package:omegaa/view/leyouts/base.dart';


import '../../componentGenerale/Tableau.dart';

import '../../componentGenerale/buttonNavigationClient.dart';
import '../../componentGenerale/entete.dart';
import 'component/VenteBlock.dart';



class VenteJour extends StatefulWidget {

  List<  List< List<List<String>>>> ventes;
  VenteJour(this.ventes);
  @override
  State<VenteJour> createState() =>VenteJourState (this.ventes);
}


class VenteJourState extends State<VenteJour> {
  int _currentIndex=0;
  Color appBarColor = Color.fromRGBO(50, 190, 166, 1);
  List<  List< List<List<String>>>> ventes;

  VenteJourState(this.ventes);

  @override
  Widget build(BuildContext context) {
    double hauteur= MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: Entete(
            flecheR: false,
            context: context,
            title: "Vente du jour",
            pageCible:(){

            },
            text: "marien",
            logo: "imagess/cadenat.png"
        ).Demarrer(),

        body:Base(
            child: [],
            content:
      Container(
        height: 340,
        child:  SingleChildScrollView(
          child:  Column(
            children: pretraitement(this.ventes),
          ) ,
        )
      ) ,

        ).lancer(hauteur-380, MediaQuery.of(context).size.width-30),

        bottomNavigationBar:ButtonNavigationClient(context: context,model: 1
        ).afficheBlock(MediaQuery.of(context).size.width)
    );
  }


  List <Widget> pretraitement(List<  List< List<List<String>>>> ventes){
    List <Widget> element=[];
    for(int i=0; i<ventes.length; i++){
     int a= i+1;
      element.add( VenteBlock(numeroVente: "$a", nomProp: ventes[i][0][0][0], heure: ventes[i][0][0][1],contenue:
      Tableau(["Produit","Quantite","Total"],ventes[i][1],MediaQuery.of(context).size.width-88).lancer(),montant:  ventes[i][0][0][2]+" Fc",));

   }

    return element;

  }
}




