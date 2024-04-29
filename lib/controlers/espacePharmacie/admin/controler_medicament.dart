
import 'package:omegaa/elper/navigation.dart';
import '../../../models/modelMedicament.dart';
import '../../../view/gestionPharmacie/adminPharmacie/medicament/EnregistrementMedicament/EnregistrementMedicament.dart';
import '../../../view/gestionPharmacie/adminPharmacie/medicament/stockProduit.dart';

class Controler_medicament{
  List<ModelMedicament> tampoProduit=[];
  var context;
  Controler_medicament(this.context);

  ajouter(){
    navigation(context,EnregistrementMedicament());
  }
  Future<String> Enregistrer(nom, forme, prix, dose, unite,medicamentquantite,dateExp) async{
    int verificationProd=0;

if (medicamentquantite!="" && dateExp!="00-00-0000"){


  int verificationProd= await ModelMedicament(nom:nom,forme: forme,prix: prix,dose: dose,unite: unite,quantite_detail: medicamentquantite,dateExpiration: dateExp).ajouter();
  if(verificationProd==0){

    return "le produit existe deja ou le champ est vide ";
  }else{
    ajouter();
    return  "produit  "+nom+forme+dose+unite+"ajouter avec succes";
  }
}
else{
  print("0000000000000000000000000000000000000000000000000000000000");
  int verificationProd= await ModelMedicament(nom:nom,forme: forme,prix: prix,dose: dose,unite: unite).ajouter();
  if(verificationProd==0){

    return "le produit existe deja ou le champ est vide ";
  }else{
    ajouter();
    return  "produit  "+nom+forme+dose+unite+"ajouter avec succes";
  }
}



  }

  voirStock()async{
    var tab=await ModelMedicament.afficher();
    navigation(context, StockProduit(await ModelMedicament.afficher()));
  }
  modifier(dateExpiration, quantite,id_pharmacie,id_medicament,{quantite_paquet=0}) async {
    ModelMedicament.modifier(id_medicament, id_pharmacie,dateExpiration: dateExpiration,quantite: quantite,quantite_paquet:quantite_paquet );
    navigation(context, StockProduit(await ModelMedicament.afficher()));
  }
  rechercher(String medoc)async{
    return await ModelMedicament.rechercher(medoc);
  }

}


