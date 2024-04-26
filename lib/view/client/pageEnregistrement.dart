import 'package:flutter/material.dart';
import '../../controlers/controler_client.dart';
import '../../controlers/controler_pharmacie.dart';
import '../../controlers/controllerAuth.dart';
import 'package:omegaa/elper/navigation.dart';
import '../componentGenerale/ButtonCostom.dart';
import '../componentGenerale/Combobox.dart';
import '../componentGenerale/InputCostom.dart';
import '../componentGenerale/entete.dart';
import '../leyouts/base.dart';


class pageEnregistrementClient extends StatefulWidget {
  static String nom_client="";
  static String prenom="";
  static String telephone="";
  static String adresseSup="";
  static String login="";
  static String mot_de_passe="";
  static String mot_de_passeConf="";
  @override
  State<pageEnregistrementClient> createState() => pageEnregistrementState();
}
class pageEnregistrementState extends State<pageEnregistrementClient> {
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
                  "Créer un compte client ",
                  [
                    InputCostom(lar:longInp,long:largInp,fonctions: (val){
                      pageEnregistrementClient.nom_client=val;
                    },
                        value: "Entrer votre nom",
                        couleur:colorInput
                    ).lancer(),
                    InputCostom(lar:longInp,long:largInp,fonctions: (val){
                      pageEnregistrementClient.prenom=val;

                    },
                        value: "Entrer votre prenom",
                        couleur: colorInput
                    ).lancer(),

                    InputCostom(lar:longInp,long:largInp,fonctions: (val){
                      pageEnregistrementClient.telephone=val;
                    },
                        value: "votre telephone",
                        couleur: colorInput
                    ).lancer(),
                    InputCostom(lar:longInp,long:largInp,fonctions: (val){
                      pageEnregistrementClient.adresseSup=val;
                    },
                        value: "votre adresse complet",
                        couleur: colorInput,
                        type: TextInputType.visiblePassword,
                        estcache: true
                    ).lancer(),
                    InputCostom(lar:longInp,long:largInp,fonctions: (val){
                      pageEnregistrementClient.login=val;
                    },
                        value: "Entrer votre login",
                        couleur: colorInput,
                        type: TextInputType.visiblePassword,
                        estcache: true
                    ).lancer(),
                    InputCostom(lar:longInp,long:largInp,fonctions: (val){
                      pageEnregistrementClient.mot_de_passe=val;
                    },
                        value: "Entrer votre  mot de passe",
                        couleur: colorInput,
                        type: TextInputType.visiblePassword,
                        estcache: true
                    ).lancer(),
                    InputCostom(lar:longInp,long:largInp,fonctions: (val){
                      pageEnregistrementClient.mot_de_passeConf=val;
                    },
                        value: "confirmer votre mot de passe",
                        couleur: colorInput,
                        type: TextInputType.visiblePassword,
                        estcache: true
                    ).lancer(),
                    ButtonCostom("Créer le compte",colorButton,(){
                      Controler_client(context).Enregistrer(
                          pageEnregistrementClient.nom_client,
                          pageEnregistrementClient.prenom,
                          pageEnregistrementClient.adresseSup,
                          pageEnregistrementClient.telephone,
                          pageEnregistrementClient.mot_de_passe,
                        pageEnregistrementClient.login
                      );
                    },rad: 9).lancer()
                  ],
                  tailleT: 45
              )
            ],
          ) ,
          child: []
      ).lancer(h.height-280,h.width-25),
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
