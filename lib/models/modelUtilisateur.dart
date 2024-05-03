
import '../session/Session.dart';
import 'baseDeDonnee/BaseDeDonnee.dart';


class ModelUtilisateur{

  static BaseDeDonnee base=new  BaseDeDonnee();

  static connecter(String login,String mot_de_passe)async {
    var boll=false;
    var droit="";
    String requette="select id_pharmacie from pharmacie where mot_passe='$mot_de_passe' and login='$login'";
    var val=await ModelUtilisateur.base.reccuperationDonnees(requette);
    if(val.length!=0){

      Session.id_connect=val[0]["id_pharmacie"];
      boll=true;
    }
    return [boll,droit];
  }

  static deconnection(){
    Session.id_connect=0;
  }


}
