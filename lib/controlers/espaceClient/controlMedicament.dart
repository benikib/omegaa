
import '../../elper/navigation.dart';
import '../../models/modelMedicament.dart';
import '../../view/espaceClient/accueilClient.dart';

class Controler_medicament{

  var context;
  Controler_medicament(this.context);


  miseEnPropre(List<Map<String,dynamic>> medocs){

    List<Map<String,String>> medoc=[];
    for(int i=0; i<medocs.length; i++ ){
      medoc.add({"initial":"sp","nomPharmacie":medocs[i]["nom_pharmacie"].toString(),"nomMedicament":medocs[i]["nom_medicament"].toString(),"commune":"kin"});
    }
    return medoc;
  }

  rechercher(String medoc)async{
var e=await ModelMedicament.rechercher(medoc);
print(miseEnPropre(e));

    navigation(context,accuilleClient(miseEnPropre(e),medicament: medoc,));
  }

  filtrage(String commune ,String medoc) async{

    var e=await ModelMedicament.filtrage(commune,medoc);
    print(miseEnPropre(e));

    navigation(context,accuilleClient(miseEnPropre(e),medicament: medoc,));

  }


}

