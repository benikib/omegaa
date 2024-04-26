

import '../models/modelMedicament.dart';

StringifierCombo(List<ModelMedicament> tab){
  List<String> result=[];
if(tab.length!=0){

  for(int i=0; i<tab.length; i++){
    result.add(tab[i].toString());
  }
  return result;
}else{
  return result;
}


}

StringifierTab(List<ModelMedicament> tab){
  List<List<String>> result=[];
  if(tab.length!=0){

    for(int i=0; i<tab.length; i++){
      result.add(tab[i].toTabC());
    }
    return result;
  }else{
    return result;
  }


}