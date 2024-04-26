

import 'package:omegaa/models/MedicamentVente.dart';
import 'package:omegaa/models/modelMedicament.dart';
import 'package:omegaa/session/Session.dart';

import '../elper/formatDate.dart';
import 'baseDeDonnee/BaseDeDonnee.dart';
import 'modelMedicament.dart';


class Vente {
 int montant_total,quantite;
  String client;
  String dateV;
  String heureV;
  List<List<String>> ligneVente=[];

  Vente(this.dateV,this.heureV,this.client,this.quantite,this.montant_total,this.ligneVente);

  modifier(){

  }

  Future<int> ajouter() async {
var idVente= await BaseDeDonnee().ajoutDonnees(
     "vente",
     {"id_vente":null,
      "date":dateV,
       "heure":heureV,
     "qte_totale":quantite,
     "montant_total":montant_total,
     "nom_client":client,
     "id_pharmacie":Session.id_connect}
 );

for(int i =0; i<this.ligneVente.length; i++){
  BaseDeDonnee().ajoutDonnees(
      "medicament_vente",
      {"id_vente":idVente,
        "id_medicament":this.ligneVente[i][0],
        "quantite":this.ligneVente[i][3],
        "montant":this.ligneVente[i][4]}
  );
}

return idVente;
   }

  static voirVente() async {
    int ses=Session.id_connect;
    var d=DateTime.now();
    String date=ajoutzeroDate(d.day.toString())+"-"+ajoutzeroDate(d.month.toString())+"-"+ajoutzeroDate(d.year.toString());
    print("date"+date);
    String requette="select vente.heure, vente.id_vente,vente.montant_total,nom_client,medicament.nom_medicament,"+
        "medicament.dose, medicament.unite,medicament.forme,date,medicament_vente.quantite,medicament_vente.montant"+
        " from medicament_vente, vente, medicament, pharmacie"+
        " where medicament_vente.id_vente = vente.id_vente"
        " and medicament.id_medicament = medicament_vente.id_medicament"+
        " and pharmacie.id_pharmacie = vente.id_pharmacie"+
        " and pharmacie.id_pharmacie=$ses and vente.date='$date' order by vente.heure desc ";
    var result= await BaseDeDonnee().reccuperationDonnees(requette);
    return result;


  }



}