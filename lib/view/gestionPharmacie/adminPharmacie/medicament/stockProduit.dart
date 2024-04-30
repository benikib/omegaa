import 'package:flutter/material.dart';
import 'package:omegaa/models/modelMedicament.dart';

import 'package:omegaa/view/leyouts/base.dart';
import 'package:omegaa/view/componentGenerale/TableauGen.dart';

import '../../../../controlers/espacePharmacie/admin/controler_medicament.dart';
import '../../../../elper/Stringifier.dart';
import '../../../../elper/formatDate.dart';
import '../../../../elper/formatMois.dart';
import '../../../../elper/formatageTableau.dart';
import '../../../../elper/navigation.dart';
import '../../../../session/Session.dart';
import '../../../componentGenerale/ButtonCostom.dart';
import '../../../componentGenerale/Combobox.dart';
import '../../../componentGenerale/InputCostom.dart';
import '../../../componentGenerale/InputRecherche.dart';
import '../../../componentGenerale/Tableau.dart';
import '../../../componentGenerale/alertAjoutElement.dart';
import '../../../componentGenerale/alerteActionUnique.dart';
import '../../../componentGenerale/blockDate.dart';
import '../../../componentGenerale/entete.dart';
import '../AcceuilAdmin.dart';


class StockProduit extends StatefulWidget {
  @override
  var tampoProduit;

  StockProduit(this.tampoProduit);
  State<StockProduit> createState() => StockProduitState(this.tampoProduit);
}

class StockProduitState extends State<StockProduit> {
  int qte_paquet=0;
  int posCombo=0;
 int quantite=0;
 String dateExp="00-00-0000";
  List<ModelMedicament> tampoProduit=[];



  var indexParcour=0;
  var d=DateTime.now();
  late double longElement;
  late double longElement1;
  late double longQte;
  bool switchValue = false;


  StockProduitState(this.tampoProduit);

  @override
  Widget build(BuildContext context) {

    longElement=MediaQuery.of(context).size.width-190;
    longElement1=80;
    longQte=MediaQuery.of(context).size.width-220;
    var h=MediaQuery.of(context).size;
    return Scaffold(
      appBar:Entete(
          flecheR: true,
          context: context,
          title: "Stock",
          pageCible: (){
            navigation(context, pageAccueille());
          },
          text: "",
          logo: "imagess/Personne.png"
      ).Demarrer(),
      body:Base(content: listeProduit(context),child: [Card(
        ),]
      ).lancer(525,h.width-30),
    );
  }

  Widget listeProduit(BuildContext context){
    String _selectedDate = '';
    Color colorCombo=Colors.black12;
    return
      Container(
        width: MediaQuery.of(context).size.width-60,
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
              InputRecherche(larg:40,long: 270,context,(){}).lancer(),
              blockStock(
                  Combobox(
                      long:longElement+10 ,large: 40,
                      fonctions:(a,pos){
                        setState(() {

                          indexParcour=pos;
                          posCombo=indexParcour;
                        });
                      },
                      elements: StringifierCombo(this.tampoProduit),//Stringifier(tampoProduit),
                      colorBordure:colorCombo).lancer(i:posCombo),
                  InkWell(onTap:(){
                    Controler_medicament(context).ajouter();
                  },
                    child:Container(
                      width: longElement1,
                      child:Icon(
                        Icons.add_circle_sharp,
                      ) ,
                    )  ,
                  ),
                  InputCostom(
                    type: TextInputType.number,
                    long: longQte,
                    value: "Quant",fonctions: (v){
                    quantite =int.parse(v);

                  },elevation: 3
                  ).lancer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text((switchValue==false)?"En pièce":"En paquet"),
                    Switch(
                        activeColor: Color.fromRGBO(50, 190, 166, 1),
                       inactiveTrackColor: Colors.grey,
                        inactiveThumbColor: Colors.black,
                        value: switchValue,
                        onChanged: ((bool){
                          setState(() {
                              switchValue = bool;
                          });
                        }))
                  ],
                ),
                BlockDate(long:longElement, dateExp,(){
                  showDatePicker(
                    context: context,
                    initialDate: DateTime(d.year, d.month, d.day), // Mettre à jour la date initiale
                    firstDate: DateTime(2022),
                    lastDate: DateTime(20100, 12, 31),
                  ).then((value) {
                    setState(() {
                    dateExp=ajoutzeroDate(value!.day.toString())+"-"+ajoutzeroDate(value!.month.toString())+" "+value!.year.toString();
                    });
                  });
                },large: 35).lancer(),
              ),

              ButtonCostom(taille:7,"Ajouter au stock",Color.fromRGBO(50, 190, 166, 1), (){
                if(quantite==0 || dateExp=="00-00-0000"){
                  AlertActionUnique(
                      (){
                        Controler_medicament(context).voirStock();
                      },context,"Entrez la quantite ou la date valide","Message"
                  ).lancer();
                }

                else if (tampoProduit[indexParcour].quantite_paquet==0 && switchValue==true){
                  AlertAjoutElement(nomClient:(e){
                    qte_paquet=int.parse(e);
                  },avecTextFiel: true,
                          (){
                            Controler_medicament(context).modifier(quantite_paquet:qte_paquet,dateExp, [quantite,switchValue],
                                Session.id_connect, this.tampoProduit[indexParcour].id);
                          },
                          (){
                            Controler_medicament(context).voirStock();

                          },
                      context,
                      "Entrer le nombre de pièces par paquet",
                      "Message"
                  ).lancer();
                }else{
                  Controler_medicament(context).modifier(dateExp,[quantite,switchValue],
                      Session.id_connect, this.tampoProduit[indexParcour].id,quantite_paquet:tampoProduit[indexParcour].quantite_paquet );
                }

                }).lancer() ,

          Container(
            height: 250,
            child: Tableau(["Produit","Prix","Pièces","Paquets","Expiration"],
                StringifierTab(this.tampoProduit),
                MediaQuery.of(context).size.width-30).lancer(),
          )
    ]
    )
    );

  }


  //
  blockStock(Widget w1,Widget w2,Widget w3,Widget w4,Widget w5){
    return Container(
      height: 150,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [w1,w2],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [w3,w4],),
         w5,
        ],
      )
    );

  }




}
