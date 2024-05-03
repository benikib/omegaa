

import 'dart:ffi';

class Panier{
  List<List<dynamic>> contenue;
  int total=0;
  int quantite=0;
  Panier(this.contenue);

  ajouterElement(element){
    this.contenue.add(element);
    EviteRedondance();
  }

 static coupageId(List<List<String>> tab ){
    List<List<String>> tampo=[];

  for(int i=0; i<tab.length; i++){
    List<String> reserve=[];
    for(int j=0; j<tab[0].length; j++){
      if(j!=0){
        reserve.add(tab[i][j]);
      }
    }
    tampo.add(reserve);
  }
  return tampo;
  }

  afficheInfo(){
    List<List<String>> r= this.contenue.map((e) => [e[0].toString(),e[1].toString(),e[2].toString(),e[3][0].toString(),e[4].toString()]).toList();
    return  r;
  }

  EviteRedondance(){
    for(int i=0; i<contenue.length; i++){
      int quant=0;
      int total=0;
      int quantGros=0;
      for(int j=0; j<contenue.length; j++){
        if(contenue[i][1]==contenue[j][1] && i!=j){
          quantGros=int.parse(contenue[j][3][1].toString());
          quant+=int.parse(contenue[j][3][0].toString());
          total+=int.parse(contenue[j][4].toString());
          contenue.removeAt(j);
        }
      }
      contenue[i][3][0]=(int.parse(contenue[i][3][0].toString())+quant).toString();
      contenue[i][4]=(int.parse(contenue[i][4].toString())+total).toString();
      contenue[i][3][1]+=(quantGros);
    }
    this.total=Fairetotal();
    this.quantite=FaireQualntite();

  }

  Fairetotal(){
    int total=0;
    for(int i=0; i<contenue.length; i++){
      total+=int.parse(contenue[i][4].toString());
    }
    return total;
  }

  FaireQualntite(){
    int quantite=0;
    for(int i=0; i<contenue.length; i++){
      quantite+=int.parse(contenue[i][3][0].toString());
    }
    return quantite;
  }


   verifierExistance(String nom){
    var test=false;
    for(int i=0; i<contenue.length; i++){
      if(nom==contenue[i][1]){
        test=true;
        break;
      }
    }
    return test;

  }




}