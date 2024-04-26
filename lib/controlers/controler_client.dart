
import '../elper/navigation.dart';
import '../models/modelClient.dart';
import '../models/modelPharmacie.dart';
import '../view/auth/pageAuthentificationClient.dart';
import '../view/auth/pageAuthentificationPharma.dart';
import '../view/client/pageEnregistrement.dart';
import '../view/gestionPharmacie/adminPharmacie/medicament/EnregistrementMedicament/EnregistrementMedicament.dart';
import '../view/pharmacie/pageEnregistrement.dart';

class Controler_client{

  var context;
  Controler_client(this.context);

  ajouter(){
    navigation(context,pageEnregistrementClient());
  }
  Enregistrer(nom,prenom,adresse,numero,mot_de_passe,login)async{
    ModelClient(nom,prenom,adresse,numero,mot_de_passe,login).ajouter();

    print([nom,prenom,adresse,numero,mot_de_passe]);
    print(await ModelClient.affId(1));
    navigation(context,pageAuthentificationPharma());
  }

}