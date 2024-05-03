
import 'package:flutter/material.dart';
import 'package:omegaa/models/modelUtilisateur.dart';
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

  connecter(String login,String mot_de_passe)async{
    var val =await ModelUtilisateur.connecter(login, mot_de_passe);
    print(login);
    if(val[0]==true){
        navigation(context,pageAccueille());
    }else{
      navigation(context,pageAuthentificationPharma());
    }

    }

  deconnecter(){
    ModelUtilisateur.deconnection();
    navigation(context,pageAuthentificationPharma());
  }
  }


