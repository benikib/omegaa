import 'package:flutter/material.dart';
import 'package:omegaa/elper/navigation.dart';

import '../../../../session/Session.dart';



class OptionNavigation  {
  String text="";
  var veri=false;
  String ChaimeImage=""

 ;
  late int panier=0;
  OptionNavigation(this.text,this.ChaimeImage,{this.panier=0});

  InkWell creerOption({required   Function action,required context }){
    return
      InkWell(
        child:
        Container(

            child:
            Padding(
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(

                    children: [
                      Container(

                        child:Image.asset(this.ChaimeImage,width: 40) ,
                      ),Padding(
                          padding: EdgeInsets.only(left: 20),
                        child:(this.panier==1)?
                        CircleAvatar(
                          radius:Session.increPanier>99?12:10,
                          backgroundColor: Colors.red,
                          child:Text(Session.increPanier.toString(),style: TextStyle(
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
                        fontSize: 10
                    ),
                  )
                ],
              ),
              padding: EdgeInsets.all(5),
            )
        ),
        onTap: (){
          action();
        },
      )
    ;
  }





}