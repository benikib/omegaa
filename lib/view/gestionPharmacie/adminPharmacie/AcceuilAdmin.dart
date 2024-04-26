import 'package:flutter/material.dart';
import 'package:omegaa/elper/navigation.dart';
import '../../../controlers/controllerAuth.dart';
import '../../../controlers/espacePharmacie/admin/controler_inventaire.dart';
import '../../../controlers/espacePharmacie/admin/controler_medicament.dart';
import '../../../controlers/espacePharmacie/controler_panier.dart';
import '../../componentGenerale/entete.dart';
import '../../leyouts/base.dart';
import '../../pharmacie/component/elementBlockUniversal.dart';
import 'inventaire/accueilInventaire.dart';
import 'medicament/stockProduit.dart';

class pageAccueille extends StatefulWidget {
  @override
  State<pageAccueille> createState() => pageAccueilleState();
}

class pageAccueilleState extends State<pageAccueille> {

  Color appBarColor = Colors.lightBlueAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  Entete(
            flecheR: false,
            context: context,
            title: "",
            pageCible: null,
            text:"",
            logo: "imagess/Personne.png"
        ).Demarrer(),
        body: Base(
            child: [],
            content: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 30,
                height: 370,
                color: Colors.white,
                child:
                GridView.count(
                  padding: EdgeInsets.only(top: 30),
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 14.0,
                  children: <Widget>[
                    ElementBlock1("imagess/logo medicament.png", "Vendre",
                            (){
                              Controler_panier(context).ajouterAuPanier();
                        }, context)
                        .afficheElement(),
                    ElementBlock1(
                        "imagess/logoStocks.png", "Stock",  (){
                      Controler_medicament(context).voirStock();
                    },
                        context).afficheElement(),
                    ElementBlock1("imagess/logoInvent.png", "Inventaire",
                            (){
                          Controler_inventaire(context).faireInventaire();
                        }, context).afficheElement(),
                    ElementBlock1("imagess/logo vendeurs.png", "Vendeur",
                            (){}, context).afficheElement(),
                    ElementBlock1(
                        "imagess/PAR.png", "Deco",  (){
                      controllerAuth(context).deconnecter();

                    },
                        context).afficheElement(),
                  ],
                )

            )

        ).lancer(350,MediaQuery.of(context).size.width-30));
  }
}