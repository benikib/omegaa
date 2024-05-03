import 'package:flutter/material.dart';
import 'package:omegaa/view/pharmacie/pageEnregistrement.dart';
import 'package:colorful_circular_progress_indicator/colorful_circular_progress_indicator.dart';

import '../../controlers/controler_client.dart';
import '../../controlers/controler_pharmacie.dart';
import '../../controlers/controllerAuth.dart';
import 'package:omegaa/elper/navigation.dart';
import '../componentGenerale/ButtonCostom.dart';
import '../componentGenerale/Combobox.dart';
import '../componentGenerale/InputCostom.dart';
import '../componentGenerale/dialogue.dart';
import '../componentGenerale/entete.dart';
import '../componentGenerale/messageFlache.dart';
import '../leyouts/base.dart';
import 'component/Element.dart';
import 'component/blockAuth.dart';
import 'component/blockInt.dart';
import 'package:fluttertoast/fluttertoast.dart';


class pageAuthentificationPharma extends StatefulWidget {
  static String login="";
  static String password="";
  @override
  State<pageAuthentificationPharma> createState() => pageAuthentificationState();
}

class pageAuthentificationState extends State<pageAuthentificationPharma> {
 late  List<Widget> action;
 var attente=false;
 Color colorConnect=Colors.white24;


  @override
  Widget build(BuildContext context) {
    action=[
      ButtonCostom("Non", Colors.red,taille: 2, (){
        setState(() {
        });

      },
      ).lancer(),
      ButtonCostom("Oui", Color.fromRGBO(50, 190, 166, 1),taille: 2, (){
        Controler_pharmacie(context).ajouter();

      },
      ).lancer(),
    ];

    var h=MediaQuery.of(context).size;
    double largInp=h.width-18;
    var longInp=55;

    var colorButton= Color.fromRGBO(50, 190, 166, 1);
    var colorInput=Color.fromRGBO(230, 230, 230,1);

    InputCostom login= InputCostom(Name:"login",lar:longInp,long:largInp,couleurBorder: colorConnect,
        value: "Entrez le login ",
        couleur:colorInput
    );

    InputCostom passWord=InputCostom(Name:"passWord",lar:longInp,long:largInp,couleurBorder: colorConnect,
        value: "Entrez le mot de passe ",
        couleur:colorInput
    );

    return Scaffold(
        appBar:Entete(
            flecheR: false,
            context: context,
            title: "",
            pageCible: null,
            text: "",
            logo: null
        ).Demarrer(),
        body:Base(
            content:blockAuth(
              "Authentifiez-vous",
                blockInt(
                  login.lancer(),
                   passWord.lancer(),
                  [
                    Elemt("Création du compte",(){
                      AlertDialogue(
                          Title: "Message",
                          contenue: "Voulez-vous créer un compte ?",
                          action:action,fonctionExte: (){
                      }
                      ).lancer(context);
                    }),
                    Elemt("Mot de passe oublier ?",(){})
                  ]
                ),

                ButtonCostom("Connexion",colorButton,()async{
                 await controllerAuth(context).connecter(login.ValueAf(),passWord.ValueAf());
                }).lancer(),
            )  ,
            child: []
        ).lancer(390,h.width-25)
    );
  }


}











