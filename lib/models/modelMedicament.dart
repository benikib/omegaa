

import '../elper/Idratation.dart';
import '../session/Session.dart';
import 'baseDeDonnee/BaseDeDonnee.dart';


class ModelMedicament {
   int id;
  String dateExpiration;
  String nom;
  String forme;
  String  dose;
  String  unite;
  String  prix;
  int quantite_detail;
  int quantite_gros;
  int quantite_paquet;
 static var sess=Session.id_connect;

  String nomTable="medicament";
  static BaseDeDonnee base=new  BaseDeDonnee();

  ModelMedicament(
  {
  required this.nom,
  required this.forme,
  required this.prix,
  required this.dose,
  required this.unite,
  this.dateExpiration="-",
  this.id=0,
  this.quantite_detail=0,
    this.quantite_paquet=0,
    this.quantite_gros=0
  }
 );

  ajouter()async {

    int val=0;
// requette de verification d'existance du medoc
    String redondance= "select * from medicament inner join  medicamment_pharmacie on "+
        " medicamment_pharmacie.id_medicament=medicament.id_medicament inner join pharmacie "+
            " on pharmacie.id_pharmacie=medicamment_pharmacie.id_pharmacie "+
        " where nom_medicament='$nom' and "+
        " unite='$unite' and dose='$dose' and forme='$forme' and pharmacie.id_pharmacie=$sess ";
  var resultTest = await base.reccuperationDonnees(redondance);

    if(resultTest.length==0){

      String requetteTest2="select id_medicament from medicament "+
          " where nom_medicament='$nom' and "+
          " unite='$unite' and dose='$dose' and forme='$forme'";

      var resultTest2=await base.reccuperationDonnees(requetteTest2);
      if(resultTest2.length==0){
        val= await base.ajoutDonnees(this.nomTable,{"nom_medicament":this.nom,
          "unite":this.unite,"dose":this.dose,
          "forme":this.forme
        });
        base.ajoutDonnees("medicamment_pharmacie",{"id_medicament":val,
          "id_pharmacie":sess,"prix_medicament":this.prix,
          "quantite_detail":this.quantite_detail,
          "date_expi_medicament":this.dateExpiration,
          "quantite_gros":this.quantite_gros,
          "quantite_paquet":this.quantite_paquet,
        });

      }else{

        base.ajoutDonnees("medicamment_pharmacie",{"id_medicament":resultTest2[0]["id_medicament"],
          "id_pharmacie":sess,"prix_medicament":this.prix,
          "quantite_detail":this.quantite_detail,
          "date_expi_medicament":this.dateExpiration,
          "quantite_gros":this.quantite_gros,
          "quantite_paquet":this.quantite_paquet,
        });
        print("il ya existance interne du medoc");
      }

    }else{
      print("il ya existance du medicament");
    }

    return val;
  }

  static verifierDate() async{
    String requette="select * from medicament inner join  medicamment_pharmacie on "+
        " medicamment_pharmacie.id_medicament=medicament.id_medicament inner join pharmacie "+
        " on pharmacie.id_pharmacie=medicamment_pharmacie.id_pharmacie "+
        " where date_expi_medicament ='28-04 2024' and medicamment_pharmacie.id_pharmacie='$sess' ";
    var res=await base.reccuperationDonnees(requette);
    return (res.isEmpty)?false:true;

  }

  static modifier(int id_medicament,int id_pharmacie, {dateExpiration,required List<dynamic>
 quantite,quantite_paquet=0}){
    String qte;
    int quantiteTempo=quantite[0];
    if(quantite[1]==true) {

      qte = "quantite_gros=quantite_gros+$quantiteTempo";
    }else{

      qte="quantite_detail=quantite_detail+$quantiteTempo";
    }

    String requette="update medicamment_pharmacie set $qte,quantite_paquet=$quantite_paquet,"+
        "date_expi_medicament='$dateExpiration' where id_pharmacie=$id_pharmacie and id_medicament=$id_medicament";
    return base.modifier(requette);

  }

  static preparationPourCombo( res){
    List<ModelMedicament> valeur=[];
    for (int i =0; i<res.length; i++){
      valeur.add( ModelMedicament(nom:res[i]["nom_medicament"],forme:res[i]["forme"],prix:res[i]["prix_medicament"]
          ,dose:res[i]["dose"],unite:res[i]["unite"],dateExpiration:res[i]["date_expi_medicament"],
          quantite_detail:res[i]["quantite_detail"],id:res[i]["id_medicament"],
          quantite_paquet:res[i]["quantite_paquet"],quantite_gros:res[i]["quantite_gros"]   ));
    }

    return  valeur;
  }


  static afficher()async {
    String requette="select * from medicament inner join  medicamment_pharmacie on "+
        " medicamment_pharmacie.id_medicament=medicament.id_medicament inner join pharmacie "+
        " on pharmacie.id_pharmacie=medicamment_pharmacie.id_pharmacie "+
        " where medicamment_pharmacie.id_pharmacie='$sess'";
    var res=await base.reccuperationDonnees(requette);

    return  preparationPourCombo(res);
  }




  List<String> toTabC(){
    return [this.nom+"_"+this.forme+"_"+this.dose+""+this.unite,this.prix+" fc",this.quantite_detail.toString(),this.quantite_gros.toString(),
    this.dateExpiration
    ];

}
 static rechercher(String medoc)async{
   String requette="select * from medicament inner join  medicamment_pharmacie on "+
       " medicamment_pharmacie.id_medicament=medicament.id_medicament inner join pharmacie "+
       " on pharmacie.id_pharmacie=medicamment_pharmacie.id_pharmacie "+
       " where nom_medicament LIKE '$medoc%' and medicamment_pharmacie.id_pharmacie='$sess' ";
   var res=await base.reccuperationDonnees(requette);
   return  preparationPourCombo(res);
}

   static filtrage(String commune,String medoc)async{
     String requette="select * from medicament inner join  medicamment_pharmacie on "+
         " medicamment_pharmacie.id_medicament=medicament.id_medicament inner join pharmacie "+
         " on pharmacie.id_pharmacie=medicamment_pharmacie.id_pharmacie "+
         " where nom_medicament LIKE '$medoc%' and commune_pharmacie LIKE '$commune%' ";
     var res=await base.reccuperationDonnees(requette);
     return  res;

   }




@override
  String toString() {
    return this.nom+"_"+this.forme+"_"+this.dose+""+this.unite ;
  }



}