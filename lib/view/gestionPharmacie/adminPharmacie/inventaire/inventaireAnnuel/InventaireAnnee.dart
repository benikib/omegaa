import 'package:flutter/material.dart';
import 'package:omegaa/elper/formatMois.dart';

import '../../../../../controlers/espacePharmacie/admin/controler_inventaire.dart';
import '../../../../../elper/formatDate.dart';
import '../../../../componentGenerale/Combobox.dart';
import '../../../../componentGenerale/Tableau.dart';
import '../../../../componentGenerale/blockDate.dart';
import '../../../../componentGenerale/entete.dart';
import '../../../../leyouts/base.dart';
import '../componentIventaire/BlockGen.dart';

class inventaireAnnuel extends StatefulWidget {
  String date;
  List<List<List<String>>> donneRecup=[];
  inventaireAnnuel(this.donneRecup,this.date);
  @override
  State<inventaireAnnuel> createState() => inventaireAnnuelState(this.donneRecup,this.date);
}

class inventaireAnnuelState extends State<inventaireAnnuel> {
  List<String> listAnnees = ["2024","2025"];
  int i2=0;
  List<List<List<String>>> donneRecup=[];
  Color appBarColor = Colors.lightBlueAccent;
  late String date;
  Color cCombo=Colors.white;
  String anneeActuelle ="";

  late List< List< List<List<String>>>> ventes=[];

  inventaireAnnuelState(List<List<List<String>>> donneRecup,String date){
    this.donneRecup=donneRecup;
    this.date=date;
    this.listAnnees=renvoisAnnees(2024, 2100);
    i2=listAnnees.indexOf(date);
    anneeActuelle=date;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  Entete(
            flecheR: true,
            context: context,
            title: "Inventaire Annuel",
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
                        Container(
                          //width: 300,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(50, 190, 166, 1),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color:Colors.black12,
                                    offset: Offset(0,3),
                                    blurRadius: 7
                                )
                              ]
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Combobox(colorBordure: cCombo,large: 30,long:150,colorInterne: cCombo,fonctions: (a,b){
                                setState(() {
                                  i2=b;
                                  this.anneeActuelle=a;
                                  Controler_inventaire(context).voirInventaireAnnee(anneeActuelle);
                                });


                              },elements: listAnnees).lancer(i: i2)
                            ],
                          )


                        ),BlockGen(produit:"Produit vendu",
                          contenue:  Tableau(["Produit","Quantite","total"],this.donneRecup[0],MediaQuery.of(context).size.width-88).lancer(),montant: this.donneRecup[1][0][0].toString(),),
                        BlockGen(produit:"Statistique ", contenue: Text("stat"))]
                  )
              ),
            )

        ).lancer(450,MediaQuery.of(context).size.width-30));
  }
  renvoisAnnees(int anneeIntial, int anneeTerminale){
    List<String> annees =  [];
    for(int i=anneeIntial; i<=anneeTerminale; i++){
      annees.add(i.toString());
    }
    return annees;
  }

}