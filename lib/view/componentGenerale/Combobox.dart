import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';


class Combobox {


  List<String>? elements;
  Color? colorText;
  Color? colorBordure;
  Color? colorInterne;
  Function f;
  double large;
  double long;
  double elevation;
  var valeurPropre=[];


  Combobox({ this.elements,
    this.colorBordure,this.colorInterne=Colors.white,
    this.long=150,this.large=45,this.elevation=2,required this.f});




  Widget lancer({i=0}) {
    this.elements = (this.elements!.length == 0) ? ["Vide"] : this.elements!;


    return Container(
      height: large,
      width: long,
      decoration: BoxDecoration(
        color: this.colorInterne,
        border: Border.all(color: colorBordure!),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(this.elevation,this.elevation),
              blurRadius: this.elevation*2
          )

        ]
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 7),

        child: DropdownButton<String>(

          isExpanded: true,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Color.fromRGBO(50, 190, 166, 1),
          ),
          underline: Container(height: 0, color:this.colorInterne),
          value: elements?[i],

          items: elements?.map((String itm) {
            return DropdownMenuItem<String>(
              child: Container(
                  decoration:BoxDecoration(),
                child: Padding(
                  padding: EdgeInsets.only(left: 17),
                  child: Text(
                    itm,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontSize: 12,

                        color: Color.fromRGBO(153,153,153,1)
                    ),

                  ),
                )  ,
              ),
              value: itm,
            );
          }).toList(),

          onChanged: (String? value) {
           lancer();
           valeurPropre=[value,this.elements?.indexOf(value!)];
           f(value,this.elements?.indexOf(value!));

          },
        ),
      ),
    );
  }

}