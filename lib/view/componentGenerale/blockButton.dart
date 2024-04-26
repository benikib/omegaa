import 'package:flutter/material.dart';


import 'buttonCostum.dart';
class BlockButton{

  List<Map<String,Function>> elements;
  BlockButton(this.elements);

  ajour(){
    List<Widget> inputResult=[];
    for(int i=0; i<elements.length; i++){
      inputResult.add(ButtonCostum(elements[i].keys.first,elements[i].values.first).lancer()
      );
    }
    return inputResult;
  }

  lancer(){
    return  Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
        ajour()
        ,
      ),
    );



  }
}