import 'package:flutter/material.dart';


TextEnr(String ic,width){
  return  InkWell(
    child:Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(2,2),
                blurRadius: 4
            )
          ]
      ),
      width: width,
      height: 50,
      child: Center(
        child:Text(ic,
          style: TextStyle(
              color: Color.fromRGBO(158, 158, 158, 1)
          ),

        ) ,
      ) ,
    ) ,
    onTap: (){
    },
  );
}