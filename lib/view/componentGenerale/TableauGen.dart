import 'package:flutter/material.dart';

class TabGen {


  List<DataColumn> colonnes=[];
  List<DataRow>  value=[];
  int ch=0;
  List<DataColumn> formatageCol(List<String>tab){
    List<DataColumn>formatt=[];
    for(int i=0; i<tab.length; i++  ){
      formatt.add( DataColumn(
          label: Text(tab[i],textAlign: TextAlign.center),
          numeric: false
      ));
    }
    return formatt;
  }


  List<DataRow> formatageRow(List<List<String>>tab){
    var longuerTab =0;
    List<DataRow>formatGen=[];
    List<DataCell>formatCel=[];
    for(int i=0; i<tab.length; i++  ){
      List<DataCell>formatCel=[];
      for(int j=0; j<tab[0].length; j++){
        if(j==2 && this.ch==1){

        }else{
          if(j==0){
            longuerTab=130;
          }

          else{
            longuerTab=75;
          }
          formatCel.add( DataCell(Container(width: longuerTab.toDouble(),
              child: Center(child:Text(tab[i][j], overflow: TextOverflow.clip,) ,)),
          ));
        }
      }
      formatGen.add(DataRow(cells: formatCel));

    }
    return formatGen;
  }

  TabGen(colonnes,value,ch){
    this.ch=ch;
    this.colonnes=formatageCol(colonnes);
    this.value=formatageRow(value);
  }

  Widget createInput(String a){
    return Container(

      height: 25,
      width: 60,
      child: Theme(
        child: TextField(
          inputFormatters: [
          ],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: a,
              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(10)))),
        ),
        data: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: EdgeInsets.zero,
            )),
      ),
    );
  }


  Widget  Lancer(BuildContext context) {
    return Container(

      child:
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:  Padding(padding: EdgeInsets.only(), child:  DataTable(
            columnSpacing: 1.0,
            columns: this.colonnes,
            rows: this.value
        ),
        )
        ,


      ),
    )


    ;
  }
}