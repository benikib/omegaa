import 'package:flutter/material.dart';
import 'package:omegaa/view/pharmacie/pageEnregistrement.dart';
import '../../controlers/controllerAuth.dart';
import 'package:omegaa/elper/navigation.dart';
import '../componentGenerale/ButtonCostom.dart';
import '../componentGenerale/Combobox.dart';
import '../componentGenerale/InputCostom.dart';
import '../componentGenerale/entete.dart';
import '../leyouts/base.dart';


class pageAuthentification extends StatefulWidget {
  static String nom="";
  static String password="";
  @override
  State<pageAuthentification> createState() => pageAuthentificationState();
}
class pageAuthentificationState extends State<pageAuthentification> {
  @override
  Widget build(BuildContext context) {

    var h=MediaQuery.of(context).size;
    double largInp=h.width-10;
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
            content: Column(
              children: [
                blockEnregistrement(
                    " Authentifiez-vous",
                    [
                      polyElement(
                          175,
                        [
                          InputCostom(lar:longInp,long:largInp,fonctions: (){},
                              value: "Entrer le nom du pharmacie",
                              couleur:colorInput
                          ).lancer(),
                          polyElement(
                              95,
                              [
                                InputCostom(lar:longInp,long:largInp,fonctions: (){},
                                    value: "Entrer  le mot de  passe",
                                    couleur: colorInput,type: TextInputType.visiblePassword,
                                  estcache: true
                                ).lancer(),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Création compte" ,style: TextStyle(color: Colors.blue),),
                                    Text("Mot de passe oublier ",style: TextStyle(color: Colors.blue))
                                  ],
                                )
                              ]
                          )

                        ]
                      )
                    ,
                      ButtonCostom("Connexion",colorButton,(){

                      }).lancer(),

                    ]
                )
              ],
            ) ,
            child: []
        ).lancer(420,h.width-25)
    );
  }


}

 polyElement(long,List<Widget> element){
  return Container(
    height: long.toDouble(),

    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: element,
    ),

  );


}


