import 'package:flutter/material.dart';
import 'package:omegaa/view/auth/pageAuthentificationClient.dart';
import 'package:omegaa/view/auth/pageAuthentificationPharma.dart';

import 'package:omegaa/view/auth/pageAuthentificationVendeur.dart';
import 'package:omegaa/view/pharmacie/pageEnregistrement.dart';
import 'package:omegaa/view/test.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        primaryColor: Colors.white,
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      home:pageAuthentificationPharma(),
    );
  }
}


