import 'package:flutter/material.dart';
import 'package:omegaa/elper/navigation.dart';
import '../../../controlers/espaceClient/controler_reservation_client.dart';
import '../../../controlers/espacePharmacie/controlerVente.dart';
import '../../../controlers/espacePharmacie/controler_panier.dart';
import '../../../elper/Stringifier.dart';
import '../../../models/modelMedicament.dart';

import '../../componentGenerale/ButtonCostom.dart';
import '../../componentGenerale/Combobox.dart';
import '../../componentGenerale/InputCostom.dart';
import '../../componentGenerale/InputRecherche.dart';
import '../../componentGenerale/SwitchCostum.dart';
import '../../componentGenerale/alertAjoutElement.dart';
import '../../componentGenerale/blockvente.dart';
import '../../componentGenerale/buttonNavigationClient.dart';
import '../../componentGenerale/dialogue.dart';
import '../../componentGenerale/elementBlock.dart';
import '../../componentGenerale/entete.dart';
import '../../leyouts/base.dart';
import '../accueilClient.dart';


class Reservation extends StatefulWidget {
  var tampoProduit;

  Reservation();

  @override
  State<Reservation> createState() => ReservationState();
}

class ReservationState extends State<Reservation> {
  bool switchValue = false;
  int posCombo=0;
  int indexParcour = 0;
  var nom = "";
  int quantite = 0;
  List<ModelMedicament> tampoProduit = [];
  Color appBarColor = Color.fromRGBO(50, 190, 166, 1);
  late Color colorButton = Color.fromRGBO(50, 190, 166, 1);

  ReservationState();

  @override
  Widget build(BuildContext context) {
    var long = MediaQuery.of(context).size.width;
    var larg = MediaQuery.of(context).size.height;
    double hauteur= MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: Entete(
          flecheR: true,
          context: context,
          title: "",
          pageCible: () {
            navigation(context,accuilleClient([]));
          },
          text: "",
          logo: null)
          .Demarrer(),
      body: Base(
          child: [],
          content: BlockVente([
            ElementBlock(
                "Produit",
                Combobox(
                    colorInterne: Color.fromRGBO(228, 228, 228, 1),
                    long: long - 160,
                    fonctions: (val, pos) {
                      setState(() {
                        indexParcour = pos;
                        posCombo=indexParcour;
                      });
                    },
                    elements: [],
                    colorBordure: Color.fromRGBO(228, 228, 228, 1))
                    .lancer(i:posCombo))
                .afficheElement(),
            ElementBlock(

                "Quantite",
                InputCostom(
                    type: TextInputType.number,
                    lar: 30,
                    couleurBorder: Colors.black,
                    fonctions: (e) {
                      int quantiteTest = 0;
                    }).lancer())
                .afficheElement(),
            ElementBlock(
                "Prix",
                TextPesro(
                     "0" + "  fc ",
                    Colors.black))
                .afficheElement(),

          ], () {

          },
              InputRecherche(context, () {}, long: long - 130, larg: 40)
                  .lancer())
              .createBlock(MediaQuery.of(context).size.width))
          .lancer(350, MediaQuery.of(context).size.width - 30),
      bottomNavigationBar: ButtonNavigationClient(context: context,model: 3

      ).afficheBlock(MediaQuery.of(context).size.width),
    );
  }

  Widget TextPesro(String text, Color c) {
    return Padding(
      child: Text(
        text,
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: c),
      ),
      padding: EdgeInsets.only(top: 8, bottom: 8),
    );
  }

  alerteVente(Function action, String message) {
    return AlertDialogue(
        Title: "Alert",
        contenue: message,
        action: [
          ButtonCostom("fermer", Colors.red, () {
            //Controler_panier(context).ajouterAuPanier();
            action();
          }).lancer()
        ],
        fonctionExte: () {})
        .lancer(context);
  }
}
