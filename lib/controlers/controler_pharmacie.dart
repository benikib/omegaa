


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

  Enregistrer(nom_pharmacie,ville,commune,
      adresseSup,numeroPhone,mot_de_passe,login)async{

    ModelPharmacie(nom_pharmacie,ville,commune,
        adresseSup,numeroPhone,mot_de_passe,login).ajouter();

    print([nom_pharmacie,ville,commune,
        adresseSup,numeroPhone,mot_de_passe]);
    print(await ModelPharmacie.affId(2));
    navigation(context,pageAuthentificationPharma());
  }

}