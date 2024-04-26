import 'package:flutter/material.dart';
import 'package:omegaa/elper/formatMois.dart';

import '../../../../../controlers/espacePharmacie/admin/controler_inventaire.dart';
import '../../../../../elper/formatDate.dart';
import '../../../../componentGenerale/Tableau.dart';
import '../../../../componentGenerale/blockDate.dart';
import '../../../../componentGenerale/entete.dart';
import '../../../../leyouts/base.dart';
import '../componentIventaire/BlockGen.dart';

class inventaireJournaliere extends StatefulWidget {
String date;
  List<List<List<String>>> donneRecup=[];
  inventaireJournaliere(this.donneRecup,this.date);
  @override
  State<inventaireJournaliere> createState() => inventaireJournaliereState(this.donneRecup,this.date);
}

class inventaireJournaliereState extends State<inventaireJournaliere> {
  List<List<List<String>>> donneRecup=[];
  Color appBarColor = Colors.lightBlueAccent;
  String date;

  late List< List< List<List<String>>>> ventes=[];

  inventaireJournaliereState(this.donneRecup,this.date);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  Entete(
            flecheR: true,
            context: context,
            title: "Inventaire du jour ",
            pageCible: (){
              Controler_inventaire(context).faireInventaire();
            },
            text:"",
            logo: "imagess/Personne.png"
        ).Demarrer(),
        body: Base(
            child: [],
            content: SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                      children: [
                        BlockDate(date,(){
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2022),
                            lastDate: DateTime(20100, 12, 31)
                          ).then((value) {
                            setState(() {
                              String dates=ajoutzeroDate(value!.day.toString())+"-"+ajoutzeroDate(value!.month.toString())+"-"+ajoutzeroDate(value.year.toString());
                              String hdate="Le "+ajoutzeroDate(value!.day.toString())+" "+formatMois(value!.month.toString())+" "+value!.year.toString();
                              Controler_inventaire(context).voirInventaireJour([dates,hdate]);
                            });
                          });
                        }).lancer(),
                        BlockGen(produit:"Produit vendu",
                          contenue:  Tableau(["Produit","Quantite","total"],this.donneRecup[0],MediaQuery.of(context).size.width-88).lancer(),montant: this.donneRecup[1][0][0].toString(),),
                        BlockGen(produit:"Statistique ", contenue: Text("stat"))
                      ]
                  )
              ),
            )

        ).lancer(450,MediaQuery.of(context).size.width-30));
  }


}