

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
  print(await ModelMedicament.afficher());
    navigation(context, AjoutPanier(await ModelMedicament.afficher()));
  }

  Enregistrer(List<ModelMedicament> listE,int index, var quantite,bool switchV)async{

  if(!listE.isEmpty){
    ModelMedicament e=listE[index];
    var element = [
      e.id.toString(),
      e.nom.toString(),
      e.prix.toString(),
      [quantite,switchV],
      quantite.toString(),
      e.quantite_paquet
    ];
    await  cPanier().ajouterElement(element);


  }



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