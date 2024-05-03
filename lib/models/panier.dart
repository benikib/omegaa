
import '../session/Session.dart';
import '../session/panier.dart';
import 'baseDeDonnee/BaseDeDonnee.dart';

class cPanier{
  var session=Session.id_connect;

  createPanier(){
    Session.panier=Panier([]);
  }

  ajouterElement(List<dynamic> element)async{
    if(!Session.panier.verifierExistance(element[1])){
      Session.increPanier+=1;
    }
    int id=int.parse(element[0]);
    var quantDetailBd=await BaseDeDonnee().reccuperationDonnees("select quantite_detail"+
        " from medicamment_pharmacie  where id_pharmacie=$session and id_medicament=$id");

    if(int.parse(element[3][0].toString())> quantDetailBd[0]["quantite_detail"] && element[3][1]==false){

      int reste=element[3][0]-quantDetailBd[0]["quantite_detail"];
      print(reste);
      if(reste<=element[5]){

        await BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET "
            "quantite_gros=quantite_gros-1 where id_pharmacie=$session and id_medicament=$id");
        element[3][1]=1;
        element[4]= element[3][0]* int.parse(element[2]) ;

         num nouveauDetail=(1*element[5])-reste;
         print("$nouveauDetail,dddgggd");
        element[5]=element[5].toString();

        await BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET "
            "quantite_detail=$nouveauDetail where id_pharmacie=$session and id_medicament=$id");
        Session.panier.ajouterElement(element);

      }
      else{

        int resteCap = (reste ~/ element[5])  ;
        if(reste % element[5]==0){
          int restInt=resteCap;
          await BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET "
              "quantite_gros=quantite_gros-$restInt where id_pharmacie=$session and id_medicament=$id");
          element[3][1]=restInt;
          Session.panier.ajouterElement(element);

        }else{

          int restInt=resteCap;
          restInt+=1;
          element[3][1]=restInt;
          num nouveauDetail=(restInt*element[5])-reste;

          await BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET "
              "quantite_gros=quantite_gros-$restInt where id_pharmacie=$session and id_medicament=$id");

          await BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET "
              "quantite_detail=$nouveauDetail where id_pharmacie=$session and id_medicament=$id");
          element[3][1]=restInt;
          Session.panier.ajouterElement(element);

        }
      }

    }else{
      int c=element[3][0];
      element[3][0]=(element[3][1]==true)?element[3][0]*element[5]:element[3][0];
      element[3][1]=(element[3][1]==true)?c:0;
      element[4]= element[3][0]* int.parse(element[2]) ;
      decrementationBd(id,element[3],element[5]);
      element[5]=element[5].toString();
      Session.panier.ajouterElement(element);

    }
    }


  decrementationBd(var id,List<dynamic> quantite,int cap) async{



      var qte=quantite[0];
      var gros=quantite[1];
      var detail=quantite[0]-(gros*cap);

      await BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET "
          "quantite_gros=quantite_gros-$gros where id_pharmacie=$session and id_medicament=$id");

      await BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET "
          "quantite_detail=quantite_detail-$detail where id_pharmacie=$session and id_medicament=$id");

  }

  afficheContenu(){
   var  v= Session.panier.afficheInfo();
    return [Session.panier.afficheInfo(),Session.panier.Fairetotal()];

  }
  viderPanier() {
    Session.panier=Panier([]);
    Session.increPanier=0;
  }

  remettreElement(){

    for(int i=0; i<Session.panier.contenue.length; i++){
      print(Session.panier.contenue[i][3]);
      int gros=Session.panier.contenue[i][3][1];
      int detail=int.parse(Session.panier.contenue[i][3][0])-(gros*int.parse(Session.panier.contenue[i][5] as String) );

      var id=int.parse(Session.panier.contenue[i][0]);

      BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET quantite_gros=quantite_gros+$gros"
          " where id_pharmacie=$session and id_medicament=$id");

      BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET quantite_detail=quantite_detail+$detail"
          " where id_pharmacie=$session and id_medicament=$id");
    }
  }

}