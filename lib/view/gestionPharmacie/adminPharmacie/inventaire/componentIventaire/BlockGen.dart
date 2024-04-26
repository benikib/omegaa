import 'dart:ffi';

import 'package:flutter/material.dart';

class BlockGen extends StatefulWidget {
  late String produit="";
  late String montant="";


  late Widget contenue;
  BlockGen({required this.produit,required this.contenue,this.montant=""});
  @override
  State< BlockGen > createState() =>StateBlockGen(this.produit,this.contenue,montant: this.montant);
}

class StateBlockGen extends State<BlockGen > {
  late String produit="";
  late String nomProp="";
  late String montant="";


  late bool visible=false;
  late int veri=0;
  late Widget contenue;
  late double taille=0;
  late String deroulant="imagess/ouv.png";

  StateBlockGen(this.produit,this.contenue,{this.montant=""});

  @override
  Widget build(BuildContext context) {
  
    return  Padding(padding: EdgeInsets.only(top: 15,bottom: 15),
        child:Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                    child:Visibility(
                      visible: visible,
                      child: Container(
                        width:MediaQuery.of(context).size.width-88 ,
                        margin:EdgeInsets.only(top:70),
                        child: contenue,
                      ),
                    ),
                    width:MediaQuery.of(context).size.width-88,
                    height: this.taille,
                    decoration:BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 7,
                          ),
                        ],

                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    )
                )
              ],
            )
            ,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  padding: EdgeInsets.only(left: 15,right: 15),
                  width:MediaQuery.of(context).size.width-60 ,
                  height: 65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text( produit,style: TextStyle(
                            fontSize: 19,
                            color: Colors.grey
                          ),),
                          (this.montant!="")?Text("Montant vendu :"+this.montant,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.red
                          ),
                          ):  Container(),
                          
                        ],
                      )
                     ,
                      InkWell(
                        child: Image.asset(this.deroulant,width: 28,color:Color.fromRGBO(50, 190, 166, 1) ,) ,
                        onTap: (){
                          setState((){
                            if(veri==0){
                              this.deroulant="imagess/ferme.png";
                              this.taille=300 ;
                              visible=true;
                              veri=1;
                            }else{
                              visible=false;
                              this.deroulant="imagess/ouv.png";
                              this.taille=0;
                              veri=0;
                            }


                          });

                        },
                      )
                    ],
                  ),
                  decoration:BoxDecoration(

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 7,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),

                )

              ],
            )
            ,
          ],

        )) ;
  }
  verifiStatut(){
    if(veri==0){
      return Text("");
    }else{
      return this.contenue;
    }
  }






}

