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
    var width=MediaQuery.of(context).size.width;

    InputCostom nomMedoc= InputCostom(Name:"nomMedoc" ,elevation:5,long: width-140,lar: 50,
        value: "Nom du produit"
    );
    InputCostom doseMedoc= InputCostom(Name:"doseMedoc",elevation:5,long: width-140,lar: 50,
        value: "Dose"
    );
    InputCostom prixMedoc= InputCostom(Name:"prixMedoc",elevation:5,long: width-140,lar: 50,
        value: "prix"
    );

    Combobox formeMedoc=  Combobox(
        colorInterne: Colors.white,
        long: width-140,
        elevation: 5
        ,
        elements:tampoProduit,
        colorBordure: Colors.white,
      f: (x,y){

      }
    );
    Combobox uniteMedoc=  Combobox(
        colorInterne: Colors.white,
        long: width-140,
        elevation: 5
        ,
        elements:this.dose,
        colorBordure: Colors.white,
      f:(x,y){

      }
    );


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
      body: Base(content:
          BlockElement([
          LigneElement([
          nomMedoc.lancer(),
        IconEnr(width, Icons.add)
        ]).lancer()
    ,
    LigneElement([
    formeMedoc.lancer(),
    IconEnr(width, Icons.add)
    ]).lancer(),


    LigneElement([
   doseMedoc.lancer()
    ,
    uniteMedoc.lancer()
    ]).lancer(),

    LigneElement([
    prixMedoc.lancer(),
    TextEnr("Fc",width-330)
    ]).lancer(),

    ButtonCostom("Enregistrer",Color.fromRGBO(50, 190, 166, 1),(){
      print([nomMedoc.ValueAf(),
        formeMedoc.valeurPropre[0], prixMedoc.ValueAf(),
        doseMedoc.ValueAf(),   uniteMedoc.valeurPropre[0]]);

      Controler_medicament(context).Enregistrer(nomMedoc.ValueAf(),
        formeMedoc.valeurPropre[0], prixMedoc.ValueAf(),
        doseMedoc.ValueAf(),   uniteMedoc.valeurPropre[0]
    ) ;

    },taille: 14,mt: 6).lancer(),

    ]).lancer()
          ,child: []
      ).lancer(400,MediaQuery.of(context).size.width-30),
    );

  }
}





