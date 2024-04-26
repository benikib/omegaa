
import 'package:omegaa/elper/navigation.dart';
import 'package:omegaa/view/gestionPharmacie/adminPharmacie/inventaire/inventaireMensuel/InventaireMensuel.dart';
import '../../../elper/Idratation.dart';
import '../../../models/modelMedicament.dart';
import '../../../models/modeleInventaires.dart';
import '../../../view/gestionPharmacie/adminPharmacie/inventaire/accueilInventaire.dart';
import '../../../view/gestionPharmacie/adminPharmacie/inventaire/inventaireAnnuel/InventaireAnnee.dart';
import '../../../view/gestionPharmacie/adminPharmacie/inventaire/inventaireJournalier/inventaireJournaliere.dart';
import '../../../view/gestionPharmacie/adminPharmacie/medicament/EnregistrementMedicament/EnregistrementMedicament.dart';
import '../../../view/gestionPharmacie/adminPharmacie/medicament/stockProduit.dart';

class Controler_inventaire{

  var context;
  var a="gg";
  Controler_inventaire(this.context);

  faireInventaire(){
    navigation(context,pageInventaire());
  }

  voirInventaireJour(List<String> date)async {

   var a= await ModeleInventaires().inventaireJournaliere(date[0]);

    navigation(context,inventaireJournaliere(IdratationInventaire(a),date[1]));
  }
  voirInventaireMois(List<String> date)async {

    var a= await ModeleInventaires().ineventaireMensuelle(date[0]+"-"+date[1]);
    print(date);

    navigation(context,inventaireMensuel(IdratationInventaire(a),date));
  }

  voirInventaireAnnee(String date)async {

    var a= await ModeleInventaires(). ineventaireMensuelle(date);

    navigation(context,inventaireAnnuel(IdratationInventaire(a),date));
  }




}


