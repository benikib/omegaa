import '../elper/formatDate.dart';
import '../session/Session.dart';
import 'baseDeDonnee/BaseDeDonnee.dart';

class ModeleInventaires{
  int ses=Session.id_connect;

  String date=ajoutzeroDate(DateTime.now().day.toString())+"-"+ajoutzeroDate(DateTime.now().month.toString())+"-"+ajoutzeroDate(DateTime.now().year.toString());



  inventaireJournaliere(String dates)async{

    String requette="select sum(vente.montant_total) as montant_vendu,  sum(medicament_vente.quantite) as quantite_totale,"+
        "sum(medicament_vente.montant) as montant_total,medicament.nom_medicament,medicament.forme,"+
        " medicament.dose,medicament.unite "+
    " from medicament_vente, vente, medicament, pharmacie"+
    " where medicament_vente.id_vente = vente.id_vente"+
    " and medicament.id_medicament = medicament_vente.id_medicament"+
    " and pharmacie.id_pharmacie = vente.id_pharmacie"+
    " and pharmacie.id_pharmacie=$ses and vente.date='$dates'"+
    " group by medicament.nom_medicament ";
    var result= await BaseDeDonnee().reccuperationDonnees(requette);
    return result;

  }

  ineventaireMensuelle(String dates)async{

    String requette="select sum(vente.montant_total) as montant_vendu,  sum(medicament_vente.quantite) as quantite_totale,"+
        "sum(medicament_vente.montant) as montant_total,medicament.nom_medicament,medicament.forme,"+
        " medicament.dose,medicament.unite "+
        " from medicament_vente, vente, medicament, pharmacie"+
        " where medicament_vente.id_vente = vente.id_vente"+
        " and medicament.id_medicament = medicament_vente.id_medicament"+
        " and pharmacie.id_pharmacie = vente.id_pharmacie"+
        " and pharmacie.id_pharmacie=$ses and vente.date LIKE '%$dates' "+
        " group by medicament.nom_medicament ";
    var result= await BaseDeDonnee().reccuperationDonnees(requette);
    return result;


  }

  ineventaireAnnuelle(String dates)async{

    String requette="select sum(vente.montant_total) as montant_vendu,  sum(medicament_vente.quantite) as quantite_totale,"+
        "sum(medicament_vente.montant) as montant_total,medicament.nom_medicament,medicament.forme,"+
        " medicament.dose,medicament.unite "+
        " from medicament_vente, vente, medicament, pharmacie"+
        " where medicament_vente.id_vente = vente.id_vente"+
        " and medicament.id_medicament = medicament_vente.id_medicament"+
        " and pharmacie.id_pharmacie = vente.id_pharmacie"+
        " and pharmacie.id_pharmacie=$ses and vente.date LIKE '%$dates' "+
        " group by medicament.nom_medicament ";
    var result= await BaseDeDonnee().reccuperationDonnees(requette);
    return result;

  }
}