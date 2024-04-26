


import '../models/modelMedicament.dart';

formatageEnTableau(List<ModelMedicament>tab){
  List<List<String>>result=[];
  for(int i=0; i<tab.length; i++){
    List<String> t=[tab[i].toString(),tab[i].prix.toString()+" fc",tab[i].quantite_detail.toString(),tab[i].dateExpiration.toString()];
    result.add(t);
  }
  return result;



}