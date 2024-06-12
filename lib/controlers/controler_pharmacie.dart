


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

  Future<List<dynamic>> Enregistrer(nom_pharmacie,ville,commune,
      adresseSup,numeroPhone,mot_de_passe,login)async{

      RegExp hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (mot_de_passe.length != 8 || !hasSpecialChar.hasMatch(mot_de_passe) ) {

      return ["le mot de passe doit avoir 8  caractere  et au moins un  caractere  special  ",0];

    }





    ModelPharmacie(nom_pharmacie,ville,commune,
        adresseSup,numeroPhone,mot_de_passe,login).ajouter();

    print([nom_pharmacie,ville,commune,
        adresseSup,numeroPhone,mot_de_passe]);
    print(await ModelPharmacie.affId(2));
    navigation(context,pageAuthentificationPharma());
    return ["connection ",1];
  }


}