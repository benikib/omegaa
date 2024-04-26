import 'package:flutter/material.dart';

import 'package:omegaa/elper/navigation.dart';

import '../../session/Session.dart';



class OptionNavigation  {
  String text="";
  var veri=false;
  String ChaimeImage="";
String valeur="";
  double long,large;


  late String panier="0";
  OptionNavigation(this.text,this.ChaimeImage,{this.panier="0",this.long=65,this.large=60,this.valeur=""});

  InkWell creerOption({required   Function action,required context }){
    return
      InkWell(
        child:
        Container(

              height: this.large,
              width: this.long,
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(
                    children: [
                      Container(

                        child:Image.asset(this.ChaimeImage,width: this.large-24) ,
                      ),Padding(
                          padding: EdgeInsets.only(left: 20),
                        child:(this.panier=="1")?
                        CircleAvatar(
                          radius:Session.increPanier>99?12:10,
                          backgroundColor: Colors.red,
                          child:Text(this.valeur,style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),) ,
                        ):null ,
                      )
                      
                    ],
                  )
                  ,
                  Text(
                    this.text,
                    style: TextStyle(
                        fontSize:this.long-55
                    ),
                  )
                ],
              )
        ),
        onTap: (){
          action();
        },
      )
    ;
  }





}