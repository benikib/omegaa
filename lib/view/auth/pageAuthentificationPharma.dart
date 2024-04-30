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
                    InputCostom(lar:longInp,long:largInp,couleurBorder: colorConnect,fonctions: (v){
                      pageAuthentificationPharma.login=v;
                    },
                        value: "Entrez le login ",
                        couleur:colorInput
                    ).lancer(),
                    InputCostom(lar:longInp,long:largInp,couleurBorder: colorConnect,fonctions: (v){
                      pageAuthentificationPharma.password=v;
                    },
                        value: "Entrez le mot de passe ",
                        couleur:colorInput
                    ).lancer(),
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
                ButtonCostom("Connexion",attente:(attente==true)?true:false,colorButton,()async{
                  setState(()async
                  {
                    attente=true;
                    int v= await controllerAuth(context).connecter( pageAuthentificationPharma.login, pageAuthentificationPharma.password);

                    if(v==0){
                      setState(() {
                        colorConnect=Colors.red;
                        attente=false;
                        MessageFlache(message: "Mot de passe incorrecte");
                      });


                    }else{
                      MessageFlache(message: "Vous êtes connecté");
                    }
                  });






                }).lancer(),

            )  ,
            child: [
//InkWell(
  //child: Text("Connecter Client?"),
//)

            ]
        ).lancer(390,h.width-25)
    );
  }


}











