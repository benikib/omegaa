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

class inventaireMensuel extends StatefulWidget {

  List<String> date;

  List<List<List<String>>> donneRecup=[];
  inventaireMensuel(this.donneRecup,this.date);
  @override
  State<inventaireMensuel> createState() => inventaireMensuelState(this.donneRecup,this.date);
}

class inventaireMensuelState extends State<inventaireMensuel> {
  List<String> listeMois = ['Janvier','Fevrier','Mars','Avril','Mai','Juin','Juillet','Aout','Septembre','Octombre','Novembre','Decembre'];
  List<String> listAnnees = ["2024","2025"];
  int i=0;
  int i2=0;
  String moisActuel="";
  String anneeActuelle="" ;
  late List<List<List<String>>> donneRecup=[];
  Color appBarColor = Colors.lightBlueAccent;
  late List<String> date;
  Color cCombo=Colors.white;
  late List< List< List<List<String>>>> ventes=[];

  inventaireMensuelState(List<List<List<String>>> donneRecup,List<String> date){
    this.donneRecup=donneRecup;
    this.date=date;
    this.listAnnees=renvoisAnnees(2024, 2100);
    i2=listAnnees.indexOf(date[1]);
    i=listeMois.indexOf(formatMois(date[0])!);

     moisActuel=date[0];
     anneeActuelle=date[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  Entete(
            flecheR: true,
            context: context,
            title: "Inventaire Mensuel",
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
                          margin: EdgeInsets.symmetric(horizontal: 15),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Combobox(colorBordure: cCombo,large: 30,long:120,colorInterne: cCombo,fonctions: (a,b){
                                setState(() {
                                  i=b;
                                  this.moisActuel=formatMoisInverse(a);

                                  Controler_inventaire(context).voirInventaireMois([moisActuel,anneeActuelle]);
                                });

                              },elements: this.listeMois).lancer(i: i),
                              Combobox(colorBordure: cCombo,large: 30,long:120,colorInterne: cCombo,fonctions: (a,b){
                                setState(() {
                                  i2=b;
                                  this.anneeActuelle=a;
                                  Controler_inventaire(context).voirInventaireMois([moisActuel,anneeActuelle]);
                                });


                              },elements: listAnnees).lancer(i: i2)
                            ],
                          ),
                        )
                       ,
                        BlockGen(produit:"Produit vendu",
                          contenue:  Tableau(["Produit","Quantite","total"],this.donneRecup[0],MediaQuery.of(context).size.width-88).lancer(),montant: this.donneRecup[1][0][0].toString(),),
                        BlockGen(produit:"Statistique ", contenue: Text("stat"))
                      ]
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


  formatMoisInverse(String mois){
    String moisTampo="";
    switch (mois){
      case 'Janvier':
        moisTampo="01";
        break;
      case 'Fevrier':
        moisTampo="02";
        break;
      case 'Mars':
        moisTampo="03";
        break;
      case 'Avril':
        moisTampo="04";
        break;
      case 'Mai':
        moisTampo="05";
        break;
      case 'Juin':
        moisTampo="06";
        break;
      case 'Juillet':
        moisTampo="07";
        break;
      case 'Août':
        moisTampo="08";
        break;
      case 'Septembre':
        moisTampo="09";
        break;
      case 'Octobre':
        moisTampo="10";
        break;
      case 'Novembre':
        moisTampo="11";
        break;
      case 'Décemebre':
        moisTampo="12";
        break;

    }
    return moisTampo;

  }

}