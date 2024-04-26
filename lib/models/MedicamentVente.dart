

import 'package:omegaa/models/modelMedicament.dart';

import 'baseDeDonnee/BaseDeDonnee.dart';
import 'modelMedicament.dart';


class MedicamentVente {
  int montantPar,quantitePar, idVente;

  late int idMedicament;

  MedicamentVente(this.quantitePar,this.montantPar,this.idMedicament, this.idVente);

  modifier(){

  }

  ajouter(){


    BaseDeDonnee().ajoutDonnees(
        "medicament_vente",
        {
          "id_medicament":idMedicament,
          "id_vente":idVente,
          "quantite":quantitePar,
          "montant":montantPar}
    );

  }

  voirVente(){

  }


}