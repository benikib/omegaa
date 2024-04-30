import 'package:flutter/material.dart';
import 'package:omegaa/elper/navigation.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import '../../../controlers/espacePharmacie/admin/controler_medicament.dart';
import '../../../controlers/espacePharmacie/controlerVente.dart';
import '../../../controlers/espacePharmacie/controler_panier.dart';
import '../../../elper/Stringifier.dart';
import '../../../models/modelMedicament.dart';
import '../../../session/Session.dart';
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
import '../adminPharmacie/AcceuilAdmin.dart';

class AjoutPanier extends StatefulWidget {
  var tampoProduit;

  AjoutPanier(this.tampoProduit);

  @override
  State<AjoutPanier> createState() => PanierState(this.tampoProduit);
}

class PanierState extends State<AjoutPanier> {
  bool switchValue = false;
  int posCombo=0;
  int indexParcour = 0;
  var nom = "";
  int quantite = 0;
  List<ModelMedicament> tampoProduit = [];
  Color appBarColor = Color.fromRGBO(50, 190, 166, 1);
  late Color colorButton = Color.fromRGBO(50, 190, 166, 1);

  PanierState(this.tampoProduit);

  @override
  Widget build(BuildContext context) {
    var long = MediaQuery.of(context).size.width;
    var larg = MediaQuery.of(context).size.height;
    double hauteur= MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: Entete(
              flecheR: true,
              context: context,
              title: "Vendre",
              pageCible: () {
                navigation(context, pageAccueille());
              },
              text: "",
              logo: null)
          .Demarrer(),
      body: Base(
              child: [
            ButtonCostom("Valider", colorButton, () {
              if (!tampoProduit.isEmpty && quantite != 0) {
                var element = [
                  tampoProduit[indexParcour].id.toString(),
                  tampoProduit[indexParcour].toString(),
                  (tampoProduit[indexParcour].prix.toString() + "fc")
                      .toString(),
                  quantite.toString(),
                  (quantite * int.parse(tampoProduit[indexParcour].prix!))
                      .toString()
                ];
                AlertAjoutElement(
                        nomClient: (e) {
                          nom = e;
                        },
                        avecTextFiel: true,
                        () {
                          ControlerVent(context)
                              .ajouterUnevente([element], nom);
                          var ControlerPanier = Controler_panier(context);
                          ControlerPanier.vider();
                        },
                        () {
                          Controler_panier(context).voirPanier();
                        },
                        context,
                        "Voulez vous valider ?",
                        "Message")
                    .lancer();
              } else {
                alerteVente(() {
                  Controler_panier(context).ajouterAuPanier();
                }, "Entrer la quantite du produit !");
              }
            }, mt: hauteur-720)
                .lancer(),
          ],
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
                                elements: StringifierCombo(tampoProduit),
                                colorBordure: Color.fromRGBO(228, 228, 228, 1))
                            .lancer(i:posCombo))
                    .afficheElement(),
                ElementBlock(
                        element3: Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                    (switchValue == false) ? "pièce" : "paquet"),
                                SwitchCostum(
                                        couleurActive: Color.fromRGBO(50, 190, 166, 1),
                                        couleurDesactive: Colors.black,
                                        f: (bool) {
                                          setState(() {
                                            if (tampoProduit[indexParcour]
                                                    .quantite_gros ==
                                                0) {
                                              switchValue = false;
                                            } else {
                                              switchValue = bool;
                                            }
                                          });
                                        },
                                        value: switchValue)
                                    .lancer()
                              ],
                            ),
                          ),
                        ),
                        "Quantite",
                        InputCostom(
                            type: TextInputType.number,
                            lar: 30,
                            couleurBorder: Colors.black,
                            fonctions: (e) {
                              int quantiteTest = 0;
                              if (switchValue == false) {
                                quantiteTest = tampoProduit[indexParcour]
                                        .quantite_detail +
                                    (tampoProduit[indexParcour].quantite_gros *
                                        tampoProduit[indexParcour]
                                            .quantite_paquet);
                              } else {
                                quantiteTest =
                                    (tampoProduit[indexParcour].quantite_gros);
                              }

                              if (int.parse(e) > quantiteTest) {
                                alerteVente(() {
                                  Controler_panier(context).ajouterAuPanier();
                                },
                                    (switchValue == false)
                                        ? "la quantité est suppérieure au stock !"
                                        : "paquet");
                              } else {
                                quantite = int.parse(e);
                              }
                            }).lancer())
                    .afficheElement(),
                ElementBlock(
                        "Prix",
                        TextPesro(
                            (tampoProduit.length != 0)
                                ? tampoProduit[indexParcour].prix.toString() +
                                    " fc"
                                : "0" + "  fc ",
                            Colors.black))
                    .afficheElement(),
                ElementBlock(
                        "Reste",
                        TextPesro(
                            (tampoProduit.length != 0)
                                ? tampoProduit[indexParcour]
                                        .quantite_detail
                                        .toString() +
                                    " pcs " +
                                    tampoProduit[indexParcour]
                                        .quantite_gros
                                        .toString() +
                                    " pqts"
                                : "0" + "",
                            Colors.red))
                    .afficheElement()
              ], () {
                if (!tampoProduit.isEmpty && quantite != 0) {
                  int qteCalcul = quantite;

                  var element = [
                    tampoProduit[indexParcour].id.toString(),
                    tampoProduit[indexParcour].toString(),
                    (tampoProduit[indexParcour].prix.toString())
                        .toString(),
                    [qteCalcul, switchValue],
                    (qteCalcul)
                        .toString(),
                    tampoProduit[indexParcour].quantite_paquet
                  ];
                  Controler_panier(context).Enregistrer(element);

                } else {
                  alerteVente(() {
                    Controler_panier(context).ajouterAuPanier();
                  }, "Entrer la quantite du produit !");
                }
              },
                  InputRecherche(context, (x) {

                    FlutterRingtonePlayer.play(
                      android: AndroidSounds.notification,
                      ios: IosSounds.glass,
                      looping: true,
                      volume: 1.0,
                    );
                    FlutterRingtonePlayer.stop();

                        

                      }, long: long - 130, larg: 40)
                          .lancer())
                  .createBlock(MediaQuery.of(context).size.width))
          .lancer(350, MediaQuery.of(context).size.width - 30),
      bottomNavigationBar: ButtonNavigationClient(context: context, model: 1)
          .afficheBlock(MediaQuery.of(context).size.width),
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
