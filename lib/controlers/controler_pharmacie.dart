


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

  Future<Map<dynamic,dynamic>> Enregistrer(nom_pharmacie,ville,commune,
      adresseSup,numeroPhone,mot_de_passe,login)async{

      RegExp hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
      if (nom_pharmacie =="" || mot_de_passe == "" || login == ""){
        return {"message" : "remplir tout les champs ", "status": 101 };
      }
    if (mot_de_passe.length <= 8 || !hasSpecialChar.hasMatch(mot_de_passe) ) {
      print(hasSpecialChar.hasMatch(mot_de_passe));
      return {"message" : " Le mot de passe doit avoir  Un caractere special et au moins 8 caractere", "status": 102 };

    }



    ModelPharmacie(nom_pharmacie,ville,commune,
        adresseSup,numeroPhone,mot_de_passe,login).ajouter();

    print([nom_pharmacie,ville,commune,
        adresseSup,numeroPhone,mot_de_passe]);
    print(await ModelPharmacie.affId(2));
    navigation(context,pageAuthentificationPharma());
    return  {"message" : "Connesion reussi ", "status": 0 };
  }


}