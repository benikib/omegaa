
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
class Tableau {

  double widthParent=0;
  int fixe=59;
  int pas=7;


  List<String>Entete;
  List<List<dynamic>> contenue;

  Tableau(this.Entete,this.contenue,this.widthParent);

  lancer(){

    return  SingleChildScrollView(
      child: Container(

        padding: EdgeInsets.all(5),

        width: widthParent,

        child: Column(
          children: [
            Container(
              child:miseAjour2()[0] ,

            )
            ,
            Divider(
              thickness: 2,
            ),
            Column(
                children:
                miseAjour()
            )

          ],
        ),

      ),
    ) ;




  }
  miseAjour(){

    int pour=((Entete.length*7)+59)-7;

    double widthCont=widthParent-((pour/100)*widthParent);

    double police=widthCont-((84/100)*widthCont);

    List<Widget> listElement=[];

    for (int i=0; i<contenue.length; i++){
      List<Widget> listCont=[];

      for (int j=0; j<Entete.length; j++){

        listCont.add(

            Container(
                width:(j==0)?widthCont+20:widthCont,
              child:Center(
                  child: Text(contenue[i][j],
                    style: TextStyle(
                        fontSize: police
                    ),
                  ),
                ) )


        );
      }

      listElement.add(InkWell(
        onTap: (){
          print("hello");

        },
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:listCont,
        )) ,
      ) ;
      if(i<contenue.length-1){
        listElement.add(Divider(thickness: 1,));
      }

    }
    return listElement;
  }
  miseAjour2(){

    int pour=((Entete.length*7)+59)-7;

    double widthCont=widthParent-((pour/100)*widthParent);
    double police=widthCont-((84/100)*widthCont);

    List<Widget> listEtete=[];

    for (int i=0; i<1; i++){
      List<Widget> listCont=[];

      for (int j=0; j<Entete.length; j++){

        listCont.add(
            Container(
                width:(j==0)?widthCont+20:widthCont ,
                child:Center(
                  child: Text(Entete[j],

                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        //fontFamily: FontStyle.,
                        fontSize: police
                    ),
                  ) ,
                ))
        );

      }

     listEtete.add(Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: listCont,
     ));

    }

    return listEtete;

  }






}