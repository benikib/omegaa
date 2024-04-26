import 'package:flutter/material.dart';

import '../../../../controlers/espacePharmacie/admin/controler_inventaire.dart';

import '../../../../elper/formatDate.dart';
import '../../../../elper/formatMois.dart';
import '../../../../elper/navigation.dart';
import '../../../componentGenerale/entete.dart';
import '../../../leyouts/base.dart';
import '../AcceuilAdmin.dart';
import 'componentIventaire/BlockInventaire.dart';



class pageInventaire extends StatefulWidget {
  @override
  State<pageInventaire> createState() => pageInventaireState();
}

class pageInventaireState extends State<pageInventaire> {

  String dates=ajoutzeroDate(DateTime.now()!.day.toString())+"-"+ajoutzeroDate(DateTime.now()!.month.toString())+"-"+ajoutzeroDate(DateTime.now().year.toString());
  String hdate="Le "+ajoutzeroDate(DateTime.now()!.day.toString())+" "+formatMois(DateTime.now()!.month.toString())+" "+DateTime.now()!.year.toString();


  String mois=ajoutzeroDate(DateTime.now()!.month.toString());
  String annee=DateTime.now()!.year.toString();






  Color appBarColor = Colors.lightBlueAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:Entete(
            flecheR: true,
            context: context,
            title: "Inventaire",
            pageCible:(){
              navigation(context, pageAccueille());
            },
            text: "marien",
            logo: "imagess/Personne.png"
        ).Demarrer(),
        body: Base(
            child: [],
            content: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Inventaire", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                    BlockInventaire(inventaire: "du jour ", action: (){

                      Controler_inventaire(context).voirInventaireJour([dates,hdate]);

                    },long:MediaQuery.of(context).size.width-70 ,larg: 50).lancer(),
                    BlockInventaire(inventaire: "mensuel", action: (){
                      Controler_inventaire(context).voirInventaireMois([mois,annee]);

                    },long:MediaQuery.of(context).size.width-70 ,larg: 50).lancer(),
                    BlockInventaire(inventaire: "annuel", action: (){
                      Controler_inventaire(context).voirInventaireAnnee(annee);

                    },long:MediaQuery.of(context).size.width-70 ,larg: 50).lancer()

                  ],
                )
            )

        ).lancer(400,MediaQuery.of(context).size.width-30));
  }
}