


import 'package:omegaa/view/auth/pageAuthentificationPharma.dart';

import '../../elper/navigation.dart';
import '../../models/modelClient.dart';
import '../../view/auth/pageAuthentificationClient.dart';
import '../../view/client/pageEnregistrement.dart';
import '../../view/espaceClient/parametre.dart';
import '../controllerAuth.dart';

class Controler_espace_client{

  var context;
  Controler_espace_client(this.context);

  parametre(){
    navigation(context,Parametre());
  }
  deconnexion()async{
    controllerAuth(context).deconnecter();

  }

}