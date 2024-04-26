
import '../../elper/navigation.dart';
import '../../models/modelMedicament.dart';
import '../../view/espaceClient/accueilClient.dart';
import '../../view/espaceClient/reservation/pageChoix.dart';

class Controler_reservation{

  var context;
  Controler_reservation(this.context);


  ajouter(){
    navigation(context,Reservation());
  }

  Enregistrer(String medoc)async{

  }




}

