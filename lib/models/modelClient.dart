
import '../session/Session.dart';
import 'baseDeDonnee/BaseDeDonnee.dart';


class ModelClient  {

  String  nom;
  String  prenom;
  String  adresse;
  String  numero;
  String mot_de_passe;
  String login;
  String nomTable="client";
  static BaseDeDonnee base=new  BaseDeDonnee();

ModelClient(this.nom,this.prenom,this.adresse,this.numero,this.mot_de_passe,this.login);

  ajouter() async  {
    int id_cli=await base.ajoutDonnees(this.nomTable,{
      "nom_client":this.nom,
      "prenom_client":this.prenom,
      "adresse_client":this.adresse,
      "numero_client":this.numero
    });
    return base.ajoutDonnees("utilisateur",{
      "login":this.login,
      "mot_passe":this.mot_de_passe,
      "droit":"cli",
      "id_origine":id_cli
    });
  }
  static affId(int id) {
    String requette="select * from client where id_client=$id";
    return base.reccuperationDonnees(requette);
  }


}