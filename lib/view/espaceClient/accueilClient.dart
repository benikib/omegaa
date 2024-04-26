import 'package:flutter/material.dart';
import 'package:omegaa/elper/navigation.dart';
import 'package:omegaa/view/componentGenerale/buttonNavigationClient.dart';
import 'package:omegaa/view/espaceClient/reservation/component/rechercherFiltrer.dart';

import '../../controlers/espaceClient/controlMedicament.dart';
import '../../controlers/espaceClient/espaceClient.dart';
import '../componentGenerale/InputCostom.dart';
import '../componentGenerale/InputRecherche.dart';
import '../componentGenerale/entete.dart';
import '../componentGenerale/listviewRecherche.dart';
import '../leyouts/base.dart';


class accuilleClient extends StatefulWidget {

  List<Map<String,String>> medoc=[{"initial":"sp","nomPharmacie":"omega","nomMedicament":"para","commune":"kin"}];
  String medicament="";
  accuilleClient(this.medoc,{this.medicament=""});
  @override
  State<accuilleClient> createState() => accuilleClientState(this.medoc,this.medicament);
}

class accuilleClientState extends State<accuilleClient> {

  List<Map<String,String>> medoc=[{"initial":"sp","nomPharmacie":"omega","nomMedicament":"para","commune":"kin"}];
  accuilleClientState(this.medoc,this.medicament);
  Color appBarColor = Colors.lightBlueAccent;
  bool filtrer = false;
  String medicament="";
  int long=400;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  Entete(
          flecheR: false,
          context: context,
          title: "",
          pageCible: null,
          text:"",
          logo: "imagess/PAR.png",
          actionLogo: (){
            Controler_espace_client(context).parametre();
          }
      ).Demarrer(),
      body: Base(
          child: [],
          content: Container(
            //margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InputRecherche( context, (a) {
                      if(a!=""){
                        medicament=a;
                        Controler_medicament(context).rechercher(medicament);
                      }else{
                        navigation(context,accuilleClient([]));
                      }
                    }, long: long - 130, larg: 40,valeurInterne: this.medicament)
                        .lancer(),
                    InkWell(
                        onTap: (){
                          setState(() {
                            filtrer = !filtrer;
                          });

                        },
                        child:  Icon(Icons.filter_list,size: 30,)
                    )
                  ],
                ),
                VisibiliteContainer(isVisible: filtrer,f:(a){
Controler_medicament(context).filtrage(a, this.medicament);}),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  //color: Colors.greenAccent,
                  height: 320,

                  width: MediaQuery.of(context).size.width-30,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        listViewAdapter(medoc,context).lancer(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )



      ).lancer(450,MediaQuery.of(context).size.width-30),
      bottomNavigationBar: ButtonNavigationClient(context: context,model: 0

      ).afficheBlock(MediaQuery.of(context).size.width),

    );
  }


}