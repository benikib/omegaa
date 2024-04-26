

import '../../elper/navigation.dart';
import '../../models/modelMedicament.dart';
import '../../models/panier.dart';
import '../../view/gestionPharmacie/panier/ajoutPanier.dart';
import '../../view/gestionPharmacie/panier/panier.dart';

class Controler_panier{
  var context;

  Controler_panier(this.context);

creerPanier(){
  cPanier().createPanier();
}
 ajouterAuPanier()async{
    navigation(context, AjoutPanier(await ModelMedicament.afficher()));
  }

  Enregistrer(var element)async{
    await  cPanier().ajouterElement(element);
  ajouterAuPanier();

  }

  voirPanier(){
    navigation(context,PanierVente(cPanier().afficheContenu()[0],cPanier().afficheContenu()[1]));


  }
  vider(){
    cPanier().viderPanier();
    Controler_panier (context).voirPanier();
  }

  remettre(){
    cPanier().remettreElement();
  }







}