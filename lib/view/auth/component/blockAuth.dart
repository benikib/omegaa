import 'package:flutter/material.dart';

blockAuth(String entete,Widget block,Widget button){
  return Container(
    margin: EdgeInsets.all(10),

    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,

      children: [
        Text(entete,
          style: TextStyle(
              fontSize: 30,
              color: Color.fromRGBO(50, 190, 166, 1)
          ),

        ),
        block,
        button
      ],
    ),

  );

}