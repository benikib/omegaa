import 'package:flutter/material.dart';
import 'package:omegaa/elper/navigation.dart';
import 'package:omegaa/view/componentGenerale/buttonNavigationClient.dart';
import 'package:omegaa/view/espaceClient/reservation/component/rechercherFiltrer.dart';

import '../../controlers/espaceClient/espaceClient.dart';
import '../componentGenerale/entete.dart';
import '../componentGenerale/listviewRecherche.dart';
import '../leyouts/base.dart';


class Parametre extends StatefulWidget {
  @override
  State<Parametre> createState() => accuilleClientState();
}

class accuilleClientState extends State<Parametre> {
  late double long;

  Color appBarColor = Colors.lightBlueAccent;
  bool filtrer = false;
  @override
  Widget build(BuildContext context) {
    long=MediaQuery.of(context).size.width-45;
    return Scaffold(
      appBar:  Entete(
          flecheR: false,
          context: context,
          title: "",
          pageCible: null,
          text:"",
          logo: "imagess/PAR.png",

      ).Demarrer(),
      body: Base(
        content: Column(
          children: [
            blockParametre(long, 75).lancer("deconnexion", Icons.logout,(){
              Controler_espace_client(context).deconnexion();
            })
          ],
        ), child: []

      ).lancer(450,MediaQuery.of(context).size.width-30),
      bottomNavigationBar: ButtonNavigationClient(context: context,model: 0
      ).afficheBlock(MediaQuery.of(context).size.width),

    );
  }


}

class blockParametre{

  double larg,long;
  blockParametre(this.long,this.larg);


  lancer(String text,IconData ic,Function f){
    return InkWell(
      onTap: (){
        f();
      },
      child:Container(
        margin: EdgeInsets.only(top: 15),

        decoration: BoxDecoration(
          color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(2, 2),
                blurRadius: 2 * 2,
              ),

            ],
            borderRadius: BorderRadius.all(Radius.circular(10))

        ),
        width: this.long,
        height: this.larg,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Element(text),
            Icon(ic,weight: 20,)

          ],
        ),

      ) ,
    ) ;
  }
}

Element(String Texte){
  return Text(Texte,
    style: TextStyle(
      fontSize: 17,
      color: Color.fromRGBO(50, 190, 166, 1)
    ),
  );



}

