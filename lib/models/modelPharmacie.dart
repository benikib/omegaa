
import '../session/Session.dart';
import 'baseDeDonnee/BaseDeDonnee.dart';



class ModelPharmacie  {
  late   int ? id_pharmacie;
  String nom_pharmacie;
  String commune;
  String ville;
  String adresseSup;
  String  numeroPhone;
  String mot_de_passe;
  String login;

  String nomTable="pharmacie";
  static BaseDeDonnee base=new  BaseDeDonnee();

  ModelPharmacie(this.nom_pharmacie,this.ville,this.commune,
      this.adresseSup,this.numeroPhone,this.mot_de_passe,this.login);

  ajouter() async{
    int id_phar=await ModelPharmacie.base.ajoutDonnees(this.nomTable,{"nom_pharmacie":this.nom_pharmacie,
      "ville_pharmacie":this.ville,"commune_pharmacie":this.commune,
      "adresseSup":this.adresseSup,"numero_phone_pharmacie":this.numeroPhone
    });
    return  base.ajoutDonnees("utilisateur",{
      "login":this.login,
      "mot_passe":this.mot_de_passe,
      "droit":"phar",
      "id_origine":id_phar
    });


  }

  static affId(int id) {
    String requette="select * from pharmacie where id_pharmacie=$id";
    return ModelPharmacie.base.reccuperationDonnees(requette);
  }


}
