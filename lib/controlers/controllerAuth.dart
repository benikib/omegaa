
import 'package:flutter/material.dart';
import 'package:omegaa/models/modelUtilisateur.dart';
import 'package:omegaa/view/auth/pageAuthentificationVendeur.dart';
import 'package:omegaa/elper/navigation.dart';
import '../models/modelClient.dart';
import '../models/modelPharmacie.dart';
import '../view/auth/pageAuthentificationClient.dart';
import '../view/auth/pageAuthentificationPharma.dart';
import '../view/espaceClient/accueilClient.dart';
import '../view/gestionPharmacie/adminPharmacie/AcceuilAdmin.dart';

class controllerAuth{
  var context;
  controllerAuth(this.context);
  authPhar(){
    navigation(context,pageAuthentificationPharma());
  }

  Future<int> connecter(String login,String mot_de_passe)async{
    int veri=0;
    var val =await ModelUtilisateur.connecter(login, mot_de_passe);
    if(val[0]==true){
       if(val[1]=="phar"){
        veri=1;
        navigation(context,pageAccueille());
      }else {
        veri=0;
      }
    }
    return veri;
    }

  deconnecter(){
    ModelUtilisateur.deconnection();
    navigation(context,pageAuthentificationPharma());
  }
  }


