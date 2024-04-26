

import 'package:omegaa/session/panier.dart';

class Session{
  static int increPanier=0;
  static Panier panier=Panier([]);
  static int id_connect=0;
  static  var objet;

  static createSession(int id){
    Session.id_connect=id;
  }
  static isNull(){
    return (id_connect==0)?true:false;
  }

}