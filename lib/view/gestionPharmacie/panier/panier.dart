import 'package:flutter/material.dart';

import '../../../controlers/espacePharmacie/controlerVente.dart';
import '../../../controlers/espacePharmacie/controler_panier.dart';
import '../../../session/Session.dart';
import '../../../session/panier.dart';
import '../../componentGenerale/ButtonCostom.dart';
import '../../componentGenerale/Tableau.dart';

import '../../componentGenerale/alertAjoutElement.dart';
import '../../componentGenerale/buttonNavigationClient.dart';
import '../../componentGenerale/dialogue.dart';
import '../../componentGenerale/entete.dart';
import '../../leyouts/base.dart';

class PanierVente extends StatefulWidget {
  @override
  List<List<String>> donnee = [];
  int total;

  PanierVente(this.donnee, this.total);

  State<PanierVente> createState() => PanierState(this.donnee, this.total);
}

class PanierState extends State<PanierVente> {
  int total;
  List<List<String>> donnee = [];

  PanierState(this.donnee, this.total);

  var nom = "";


  @override
  Widget build(BuildContext context) {
    Color ColorButton = Color.fromRGBO(50, 190, 166, 1);
    double hauteur= MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: Entete(
              flecheR: false,
              context: context,
              title: "Panier",
              pageCible: () {
                //controllerMedicament(context).vendreMedicament();
              },

              text: "marien",
              logo: "imagess/cadenat.png")
          .Demarrer(),
      body: Base(
          content: Tableau(
                  ["Produit", "Prix", "Quantite", "Total"],
              Panier.coupageId(this.donnee)
              ,
                  MediaQuery.of(context).size.width - 30)
              .lancer(),
          child: [
            Card(
                margin: EdgeInsets.only(top: 5),
                child: Container(
                    width: MediaQuery.of(context).size.width - 42,
                    height: 60,
                    child: Center(child: Text("Montant total : $total fc",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),)))),
            Container(
              margin: EdgeInsets.only(top: 20),
              //color: Color.fromRGBO(50, 190, 166, 1),
                width: MediaQuery.of(context).size.width - 30,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonCostom("Annuler", Colors.red, () {
                      AlertAjoutElement(nomClient: (e) {}, () {
                        Session.increPanier = 0;
                        var ControlerPanier = Controler_panier(context);
                        ControlerPanier.remettre();
                        ControlerPanier.vider();
                      }, () {
                        Controler_panier(context).voirPanier();
                      }, context, "Voulez vous annuler ?", "Message")
                          .lancer();
                    }, taille: 3, mt: 0)
                        .lancer(),
                    ButtonCostom("Valider", ColorButton, () {

                      AlertAjoutElement(
                              nomClient: (e) {
                                nom = e;
                              },
                              avecTextFiel: true,
                              () {
                                ControlerVent(context)
                                    .ajouterVente(donnee, nom);
                                var ControlerPanier = Controler_panier(context);
                                ControlerPanier.vider();
                              },
                              () {
                                Controler_panier(context).voirPanier();
                              },
                              context,
                              "Voulez vous vraiment valider ?",
                              "Message")
                          .lancer();
                    }, taille: 3, mt: 0)
                        .lancer(),
                  ],
                ))
          ]).lancer(330, MediaQuery.of(context).size.width - 30),
      bottomNavigationBar: ButtonNavigationClient(context: context, model: 1)
          .afficheBlock(MediaQuery.of(context).size.width),
    );
  }



  alertPanier(Function actionPourOui, Function actionPourNon) {
    List<Widget> action = [
      ButtonCostom(
        "oui",
        Colors.red,
        () {
          actionPourOui();
        },
      ).lancer(),
      ButtonCostom(
        "non",
        Colors.red,
        () {
          actionPourNon();
        },
      ).lancer(),
    ];
    List<Widget> action2 = [
      ButtonCostom(
        "fermer",
        Colors.red,
        () {
          Controler_panier(context).voirPanier();
        },
      ).lancer(),
    ];
    List<Widget> res = (Session.increPanier != 0) ? action : action2;
    AlertDialogue(
            Title: "Attention",
            contenue: (Session.increPanier != 0)
                ? "voulez vous vraiment faire cette action?"
                : "le panier est vide",
            action: res,
            fonctionExte: () {})
        .lancer(context);
  }


}
