import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../controlers/espacePharmacie/admin/controler_medicament.dart';
import '../../../../componentGenerale/ButtonCostom.dart';
import '../../../../componentGenerale/Combobox.dart';
import '../../../../componentGenerale/InputCostom.dart';
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
  static  var nom_medicament,forme_medicament,doses,prixs,unite="mg";


  @override
  State<EnregistrementMedicament> createState() => EnregistrementMedicamentState();

}

class EnregistrementMedicamentState extends State<EnregistrementMedicament> {
  Color appBarColor = Color.fromRGBO(50, 190, 166, 1);
  var tampoProduit = ["forme gualelique", "Comprimer", "cipo"];
  var dose =["mg","poids","ml"];
  var nomProduit="",doseMedoc="",prix="",unite="mg";
  String msg="";

  @override
  Widget build(BuildContext context) {
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

        ButtonCostom("Enregistrer",Color.fromRGBO(50, 190, 166, 1),(){
          String medicamentNom=EnregistrementMedicament.nom_medicament ?? "";
          String medicamentForm=EnregistrementMedicament.forme_medicament ?? "";
          String medicamentPrix=EnregistrementMedicament.prixs ?? "";
          String medicamentDose=EnregistrementMedicament.doses ?? "";
          String medicamentUni=EnregistrementMedicament.unite ?? "";

          print(medicamentNom);

          if(medicamentNom=="" || medicamentPrix =="" ||  medicamentDose==""){
            MessageFlache(message: "Entrer tous les champs si possible");
          }else{
            verifification ( context,medicamentNom,
                medicamentForm, medicamentPrix,
                medicamentDose,   medicamentUni);
          }

        },taille: 14,mt: 6).lancer(),

      ]).lancer();
  }
}

