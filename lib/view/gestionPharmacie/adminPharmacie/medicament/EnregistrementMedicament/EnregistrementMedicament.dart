import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:omegaa/elper/formatDate.dart';
import 'package:omegaa/models/modelMedicament.dart';
import 'package:omegaa/session/Session.dart';
import 'package:omegaa/view/componentGenerale/alertAjoutElement.dart';
import 'package:omegaa/view/componentGenerale/alerteActionUnique.dart';
import '../../../../../controlers/espacePharmacie/admin/controler_medicament.dart';
import '../../../../componentGenerale/ButtonCostom.dart';
import '../../../../componentGenerale/Combobox.dart';
import '../../../../componentGenerale/InputCostom.dart';


import '../../../../componentGenerale/blockDate.dart';
import '../../../../componentGenerale/entete.dart';
import '../../../../componentGenerale/messageFlache.dart';
import '../../../../leyouts/base.dart';
import 'composant/BlockElement.dart';
import 'composant/IconEnr.dart';
import 'composant/LigneElement.dart';
import 'composant/TextEnr.dart';

Future<void> verifification ( context,medicamentNom,
    medicamentForm, medicamentPrix,
    medicamentDose,   medicamentUni) async {

 String msg = await  Controler_medicament(context).Enregistrer(medicamentNom,
      medicamentForm, medicamentPrix,
      medicamentDose,   medicamentUni
  ) ;

 MessageFlache(message: msg);

}

class EnregistrementMedicament extends StatefulWidget {
  static  var nom_medicament,forme_medicament,quantite,doses,prixs,unite="mg";
  var tampoProduit;

  EnregistrementMedicament(this.tampoProduit);

  @override
  State<EnregistrementMedicament> createState() => EnregistrementMedicamentState(this.tampoProduit);

}

class EnregistrementMedicamentState extends State<EnregistrementMedicament> {
  Color appBarColor = Color.fromRGBO(50, 190, 166, 1);
  var tampoProduits = ["forme gualelique", "Comprimer", "cipo"];
  List<ModelMedicament> tampoProduit=[];
  var dose =["mg","poids","ml"];
  var nomProduit="",doseMedoc="",prix="",unite="mg";
  String msg="";

  late double longElement;
  String dateExp="00-00-0000";
  bool switchValue = false;
  var d=DateTime.now();
  var indexParcour=0;
  int qte_paquet=0;

  EnregistrementMedicamentState(this.tampoProduit);

  @override
  Widget build(BuildContext context) {
    longElement=MediaQuery.of(context).size.width-190;
    return Scaffold(
      appBar: Entete(
          flecheR: true,
          context: context,
          title: "",
          pageCible: (){
            Controler_medicament(context).voirStock();
          },
          text: "",
          logo: "imagess/Personne.png"
      ).Demarrer(),
      body: Base(content: listeProduit(context),child: []
      ).lancer(400,MediaQuery.of(context).size.width-30),
    );
  }




  Widget listeProduit(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return
      BlockElement([
        LigneElement([
          InputCostom(elevation:5,long: width-140,lar: 50,
              fonctions: (v){
                EnregistrementMedicament.nom_medicament=v;
              },
              value: "Nom du produit"
          ).lancer(),

          IconEnr(width, Icons.add)
        ]).lancer()
        ,
        LigneElement([
          Combobox(
              colorInterne: Colors.white,
              long: width-140,
              fonctions: (v,g){
                EnregistrementMedicament.forme_medicament=v;
              },
              elevation: 5
              ,
              elements: [
                "Forme gualelique",
                "Comprime",
                "siro",
                "Ingectable"
              ],
              colorBordure: Colors.white
          ).lancer(),
          IconEnr(width, Icons.add)
        ]).lancer(),
    LigneElement([
      InputCostom(type:TextInputType.number,elevation:5,long: width-140,lar: 50,
          fonctions: (v){
            EnregistrementMedicament.doses=v;
          },
          value: "Dose"
      ).lancer()



      ,
      Combobox(
          colorInterne: Colors.white,
          long: 85,
          fonctions: (v){

            setState(() {
              EnregistrementMedicament.unite=v;

            });
},
          elevation: 5
          ,
          elements: ["mg", "ml", "poid"],
          colorBordure: Colors.white
      ).lancer()
    ]).lancer(),

        LigneElement([
          InputCostom(type:TextInputType.number,elevation:5,long: width-140,lar: 50,
              fonctions: (v){
                EnregistrementMedicament.prixs=v;
              },
              value: "prix"
          ).lancer(),
          TextEnr("Fc",width-330)
        ]).lancer(),

        LigneElement([
          InputCostom(type:TextInputType.number,elevation:5,long: width-190,lar: 50,
              fonctions: (v){
                EnregistrementMedicament.quantite=v;
              },
              value: "Quantite"
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
        ]).lancer(),
        if( EnregistrementMedicament.quantite!=null)
        LigneElement([
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

        ]).lancer(),


        ButtonCostom("Enregistrer",Color.fromRGBO(50, 190, 166, 1),(){
    String medicamentNom=EnregistrementMedicament.nom_medicament ?? "";
    String medicamentForm=EnregistrementMedicament.forme_medicament ?? "";
    String medicamentPrix=EnregistrementMedicament.prixs ?? "";
    String medicamentDose=EnregistrementMedicament.doses ?? "";
    String medicamentUni=EnregistrementMedicament.unite ?? "";
    String quantite =EnregistrementMedicament.quantite ?? "";

    if(medicamentNom=="" || medicamentPrix =="" ||  medicamentDose==""){
      MessageFlache(message: "Entrer tous les champs si possible");


    }else{
      verifification ( context,medicamentNom,
          medicamentForm, medicamentPrix,
          medicamentDose,   medicamentUni);
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
    }




  },taille: 14,mt: 6).lancer(),

      ]).lancer();
  }
}

