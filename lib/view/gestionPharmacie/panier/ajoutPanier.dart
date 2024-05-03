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
import '../../componentGenerale/SwitchMedoc.dart';
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
  Color colorCombo=Color.fromRGBO(228, 228, 228, 1);

  PanierState(this.tampoProduit);

  @override
  Widget build(BuildContext context) {

    //Controler_medicament(context).verifierDate();

    var long = MediaQuery.of(context).size.width;
    var larg = MediaQuery.of(context).size.height;
    double hauteur= MediaQuery.of(context).size.height;

    InputCostom quant=InputCostom(Name:"quant",type: TextInputType.number,
        lar: 30,
        couleurBorder: Colors.black);

    Combobox medoc=  Combobox(
        colorInterne: colorCombo,
        long: long - 160,
        f: (val, pos) {
          setState(() {
            indexParcour = pos;
            posCombo=indexParcour;
          });
        },
        elements: StringifierCombo(tampoProduit),
        colorBordure: colorCombo);


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
              child: [],
              content: BlockVente([
                ElementBlock(elements:[
                  TextPesro("Produit",Colors.black),
                        medoc.lancer()])
                    .afficheElement(),

                ElementBlock(
                    elements: [
                  TextPesro("Quantite",Colors.black),
                  SwitchMedoc(f:(b){
                    setState(() {
                      switchValue = b;
                    });
                  },SwitchValue: switchValue).lancer(),
                  quant.lancer()
                ]
                ).afficheElement(),

                ElementBlock(elements:[
                  TextPesro("Prix",Colors.black),
                        TextPesro(
                            tampoProduit[indexParcour].prix.toString() + " fc"
                              ,
                            Colors.black)])
                    .afficheElement(),


                ElementBlock(elements:[
                  TextPesro("Reste",Colors.black),
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
                                : "0" + "pcs",
                            Colors.red)])
                    .afficheElement()

              ], () {
                  Controler_panier(context).Enregistrer(tampoProduit,indexParcour,quant.ValueAf(),switchValue);
              },
                  InputRecherche(context, (x) {}, long: long - 130, larg: 40)
                          .lancer()

              )
                  .createBlock(MediaQuery.of(context).size.width))
          .lancer(350, MediaQuery.of(context).size.width - 30),
      bottomNavigationBar: ButtonNavigationClient(context: context, model: 1)
          .afficheBlock(MediaQuery.of(context).size.width),
    );
  }



  Widget TextPesro(String text, Color c ) {
    return Padding(
      child: Text(
        text,
        style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold, color: c),
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
