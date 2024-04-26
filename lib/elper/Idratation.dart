


import '../models/modelMedicament.dart';

Idratation(Function f,tab,t){
  for(int i =0; i<tab.length; i++){
    t.add(f(i));
  }
  return t;

}



IdratationVente(List<Map<String,dynamic>> donnee){
  List<int>idExiste=[];
  List<  List< List<List<String>>>> fin=[];
  for(int i=0; i<donnee.length; i++){
    if(!idExiste.contains(donnee[i]["id_vente"])){
      var h=donnee[i]["id_vente"];
      idExiste.add(donnee[i]["id_vente"]);
    }
  }
  int tamp=0;
  for(int i=0; i<idExiste.length; i++){
    List< List<List<String>>> rec=[];
    List<List<String>> ligne=[];
    for(int j=0; j<donnee.length; j++){
      if(idExiste[i]==donnee[j]["id_vente"]){
        tamp=j;
        ligne.add([donnee[j]["nom_medicament"]+" "+donnee[j]["forme"]+"  "+donnee[j]["dose"]+"  "+donnee[j]["unite"],donnee[j]["quantite"].toString(),donnee[j]["montant"].toString()]);
      }
    }
    rec.add([[donnee[tamp]["nom_client"],donnee[tamp]["heure"],donnee[tamp]["montant_total"].toString()]]);
    rec.add(ligne);
    fin.add(rec);
  }

  return fin;

}

IdratationInventaire(List<Map<String,dynamic>> donnee){

  List<List<String>> donneRecup=[];
  int montants=0;
  for(int i=0; i<donnee.length; i++){
    montants=montants+int.parse(donnee[i]["montant_vendu"].toString());
    donneRecup.add([donnee[i]["nom_medicament"]+" "+donnee[i]["forme"]+" "+donnee[i]["dose"]+" "+donnee[i]["unite"],donnee[i]["quantite_totale"].toString(),donnee[i]["montant_total"].toString()+" Fc"]);
  }

  return [donneRecup,[[montants.toString()]]];

}