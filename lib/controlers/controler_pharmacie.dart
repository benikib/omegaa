


import '../elper/navigation.dart';
import '../models/modelPharmacie.dart';
import '../view/auth/pageAuthentificationPharma.dart';
import '../view/gestionPharmacie/adminPharmacie/medicament/EnregistrementMedicament/EnregistrementMedicament.dart';
import '../view/pharmacie/pageEnregistrement.dart';

class Controler_pharmacie{

  var context;
  Controler_pharmacie(this.context);


  ajouter(){
    navigation(context,pageEnregistrement());
  }

  Enregistrer(nom_pharmacie,mot_de_passe,confirmation,login)async{

    print(nom_pharmacie);

    ModelPharmacie(nom_pharmacie,mot_de_passe,login).ajouter();

    navigation(context,pageAuthentificationPharma());
  }

}