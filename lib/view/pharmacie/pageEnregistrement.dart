import 'package:flutter/material.dart';
import '../../controlers/controler_pharmacie.dart';
import '../../controlers/controllerAuth.dart';
import 'package:omegaa/elper/navigation.dart';
import '../componentGenerale/ButtonCostom.dart';
import '../componentGenerale/Combobox.dart';
import '../componentGenerale/InputCostom.dart';
import '../componentGenerale/entete.dart';
import '../leyouts/base.dart';


class pageEnregistrement extends StatefulWidget {
  static String nom_pharmacie="";
  static String telephone="";
  static String ville="";
  static String commune="";
  static String adresseSup="";
  static String mot_de_passe="";
  static String mot_de_passeConf="";
  static String login="";
  @override
  State<pageEnregistrement> createState() => pageEnregistrementState();
}
class pageEnregistrementState extends State<pageEnregistrement> {
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size;
    double largInp=h.width-18;
    var longInp=40;
    var colorButton= Color.fromRGBO(50, 190, 166, 1);
    var colorInput=Color.fromRGBO(230, 230, 230,1);

    return  Scaffold(
        appBar:Entete(
            flecheR: false,
            context: context,
            title: "",
            pageCible: null,
            text: "",
            logo: null
        ).Demarrer(),

        body:Base(
          content: Column(
            children: [
              blockEnregistrement(
                "Créer un compte pharmacie ",
                [
                  InputCostom(lar:longInp,long:largInp,fonctions: (val){
                    pageEnregistrement.nom_pharmacie=val;
                  },
                      value: "Nom du pharmacie",
                    couleur:colorInput
                  ).lancer(),
                  InputCostom(lar:longInp,long:largInp,fonctions: (val){
                    pageEnregistrement.telephone=val;

                  },
                      value: "Telephone pharmacie",
                      couleur: colorInput
                  ).lancer(),
                  Combobox(
                    fonctions: (val,y){
                      print(val);
                      pageEnregistrement.ville=val;
                    },elements: ["ville de résidance","Kinshasa"],
                      large:longInp.toDouble() ,
                      long: largInp,
                    colorBordure: Colors.white24,
                    colorInterne: colorInput
                  ).lancer(),
                  Combobox(
                      fonctions: (val,f){
                        pageEnregistrement.commune=val;
                      },elements: ["commune résidence","kinshasa","mont-ngafula","matete"],
                      large:longInp.toDouble() ,
                      long: largInp,
                      colorBordure: Colors.white24,
                      colorInterne: colorInput
                  ).lancer(i:0),
                  InputCostom(lar:longInp,long:largInp,fonctions: (val){
                    pageEnregistrement.adresseSup=val;
                  },
                      value: " rue et quartier",
                      couleur: colorInput
                  ).lancer(),
                  InputCostom(lar:longInp,long:largInp,fonctions: (val){
                    pageEnregistrement.login=val;
                  },
                      value: "login",
                      couleur: colorInput,

                  ).lancer(),
                  InputCostom(lar:longInp,long:largInp,fonctions: (val){
                    pageEnregistrement.mot_de_passe=val;
                  },
                      value: "mot de passe",
                      couleur: colorInput,
                      type: TextInputType.visiblePassword,
                      estcache: true
                  ).lancer(),
                  InputCostom(lar:longInp,long:largInp,fonctions: (val){
                    pageEnregistrement.mot_de_passeConf=val;
                  },
                      value: "confirmer le mot de passe",
                      couleur: colorInput,
                     type: TextInputType.visiblePassword,
                      estcache: true
                  ).lancer(),
                  ButtonCostom("Créer le compte",colorButton,(){
                    Controler_pharmacie(context).Enregistrer(
                        pageEnregistrement.nom_pharmacie,
                        pageEnregistrement.ville,pageEnregistrement.commune,
                      pageEnregistrement.adresseSup,pageEnregistrement.telephone,pageEnregistrement.mot_de_passe,pageEnregistrement.login);

                  },rad: 9).lancer()
                ],
                tailleT: 45
              )
            ],
          ) ,
          child: []
        ).lancer(h.height-270,h.width-25),
    );

  }

}




Widget  blockEnregistrement(String title,List<Widget> element,{tailleT=60}){
  Widget titre=Container(
    height: tailleT.toDouble(),
    child: Center(child:Text(
        title,
      style: TextStyle(
        color:  Color.fromRGBO(50, 190, 166, 1),
        fontSize: 22
      ),
    )
    ),
  );
  element.insert(0,titre);

  return Expanded(child:
  Container(

    child:Padding(
      padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: element,
      ),
    ) ,
  )
  )  ;




}
