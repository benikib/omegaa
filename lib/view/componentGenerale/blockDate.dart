import 'package:flutter/material.dart';

class BlockDate {
  String date="";
  Function actionDate;
  double long,large;


  BlockDate(this.date,this.actionDate,{this.long=300,this.large=40});

  lancer(){
    return Container(
      width: this.long,
      height: this.large,

      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color:Color.fromRGBO(50, 190, 166, 1),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color:Colors.black12,
                offset: Offset(0,3),
                blurRadius: 7
            )
          ]

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(this.date,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15
          ),
          ),
          InkWell(
            child:Icon(Icons.date_range_sharp,
              color: Colors.white,

            )
            ,
            onTap: (){
              actionDate();
            },
          )
          ,
        ],
      ),
    );
  }
}