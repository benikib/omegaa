
import 'package:flutter/material.dart';
import 'package:omegaa/view/leyouts/base.dart';
import 'componentGenerale/Tableau.dart';
import 'componentGenerale/entete.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class Test extends StatefulWidget{
  @override
  State<Test> createState() =>TestState ();
}


class TestState extends State<Test> {
  int _currentIndex=0;
  static const LatLng pos=LatLng(-4.445018,15.281661);
  Color appBarColor = Color.fromRGBO(50, 190, 166, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Entete(
          flecheR: true,
          context: context,
          title: "Vente",
          pageCible:null,
          text: "marien",
          logo: "imagess/cadenat.png"
      ).Demarrer(),
      body:GoogleMap(
        initialCameraPosition:
          CameraPosition(target: pos,zoom: 2)
        ,markers: {
          Marker(markerId: MarkerId( "_currentLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: pos)
    },
    ));
  }

}







