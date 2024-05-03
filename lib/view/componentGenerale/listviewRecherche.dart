import 'package:flutter/material.dart';

import '../../controlers/espaceClient/controler_reservation_client.dart';
import '../espaceClient/reservation/pageChoix.dart';


class listViewAdapter{

  List<Map<String,String>> medoc;
  var contex;


  listViewAdapter(this.medoc,this.contex);

  lancer(){
   return Container(
     height: 400,
     child: ListView.separated(
       itemCount: this.medoc.length,
       itemBuilder: (BuildContext context, int index){
         return InkWell(
             onTap: () {

         },
          child: ListTile(
           leading: Container(
             width: 60,
             child: CircleAvatar(
               backgroundColor: Colors.greenAccent,
               radius: 60,
               child: Text(this.medoc[index]["initial"]!,style: TextStyle(
                   fontWeight: FontWeight.bold
               )),
             ),
           ),

           title: Text(this.medoc[index]["nomPharmacie"]!, style: TextStyle(
               fontWeight: FontWeight.bold
           ),),
           subtitle: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(this.medoc[index]["nomMedicament"]!),
               Row(
                 children: [
                   Icon(Icons.location_on, color: Colors.red,size: 20),
                   Text(this.medoc[index]["commune"]!),
                 ],
               )

             ],
           ),
         )
         );
       },
       separatorBuilder: (BuildContext context, int index) {
         return Divider(
         color: Colors.grey,
         thickness: 1,
       );
       }
     ),
   );
  }
}

