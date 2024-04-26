import 'package:flutter/material.dart';


class Entete {
late var context;
late var title;
late Function ?pageCible;
late var text;
 String  ?logo;
late var flecheR;

late Function ?actionLogo;

  Entete({this.flecheR,this.context,this.title,required this.pageCible,this.text,this.logo,this.actionLogo}){
      if(this.flecheR==false){
        this.flecheR=null;
      }else{
        this.flecheR= IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              this.pageCible!();
      });
    }
  }

  Demarrer(){
    return AppBar(
      leading: this.flecheR,
      title:Text(title) ,

      backgroundColor: Color.fromRGBO(50, 190, 166, 1),
      actions: [
        Row(
          children: [
            Container(
              child: Text(this.text),
            ),
            (this.logo!=null)?
                InkWell(
                  child:Container(
                      child: Image.asset(this.logo!,width: 65)
                  ) ,
                  onTap: (){
                    print("hello");
                    this.actionLogo!();
                  },
                )
            :Center()
          ],
        )
      ],
    );




  }



}