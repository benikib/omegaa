
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class BaseDeDonnee {

  Database ? _database;

  Future<Database> get database async{
    if(_database!=null)return _database!;
    return await createDatabase();

  }

  Future<Database> createDatabase () async {
    Directory directory=await getApplicationDocumentsDirectory();
    final path=join(directory.path,"omegapharma5.db");
    return await openDatabase(
      path,
      version:1,
        onCreate: onCreate
    );


  }
  onCreate(Database database,int version)async{
    await database.execute('''
    CREATE TABLE utilisateur(
    login TEXT NOT NULL,
    mot_passe TEXT NOT NULL,
    droit TEXT NOT NULL,
    id_origine INTEGER 
    )
    ''');

    //création des tables
    await database.execute('''
    CREATE TABLE medicament(
    id_medicament INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_medicament TEXT NOT NULL,
    unite TEXT,
    dose TEXT ,
    forme TEXT
    )
    ''');

    await database.execute('''
    CREATE TABLE medicamment_pharmacie(
    id_medicament INTEGER,
    id_pharmacie INTEGER,
    prix_medicament TEXT,
    quantite_detail INTEGER,
    quantite_gros INTEGER,
    quantite_paquet INTEGER,
    date_expi_medicament TEXT
    )
    ''');

    await database.execute('''
    CREATE TABLE pharmacie(
    id_pharmacie INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_pharmacie TEXT NOT NULL,
    ville_pharmacie TEXT NOT NULL,
    commune_pharmacie TEXT NOT NULL,
    adresseSup TEXT,
    numero_phone_pharmacie TEXT 

    )
    ''');
    await database.execute('''
    CREATE TABLE medicament_vente(
    id_vente INTEGER ,
    id_medicament INTEGER,
    quantite INTEGER,
    montant INTEGER
    )
    ''');
    await database.execute('''
    CREATE TABLE vente(
    id_vente INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL,
    heure TEXT NOT NULL,
    qte_totale INTEGER,
    montant_total INTEGER,
    nom_client TEXT,
    id_pharmacie int
    )
    ''');

    await database.execute('''
    CREATE TABLE client(
    id_client INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_client TEXT ,
    prenom_client TEXT,
    adresse_client TEXT,
    numero_client TEXT
   
    )
    ''');
    await database.execute('''
    CREATE TABLE reservation_medicament(
    id_reservation INTEGER,
    id_medicament INTEGER
    )
    ''');
    await database.execute('''
    CREATE TABLE reservation(
    id_reservation INTEGER PRIMARY KEY AUTOINCREMENT,
    id_client INTEGER,
    id_pharmacie INTEGER,
    quantite INTEGER,
    montant_total INTEGER,
    date TEXT,
    heure TEXT
    )
    ''');

    await database.execute('''
    CREATE TABLE vendeur(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    id_pharmacie INTEGER
    )
    ''');

    await database.execute('''
    CREATE TABLE abonnement(
    id_abonnement  INTEGER PRIMARY KEY AUTOINCREMENT,
    date_debut TEXT,
    date_fin TEXT
    id_type_abonnement
    )
    ''');
    await database.execute('''
    CREATE TABLE type_abonnement(
    id_type_abonnement  INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_type_abonnement TEXT
    )
    ''');

  }


  Future<List<Map<dynamic,dynamic>>> reccuperationDonnees (String requette) async{
    Database db=await database;
    List<Map<dynamic,dynamic>> mapliste=await db.rawQuery(requette);
    return mapliste.toList();
  }

  Future<int>ajoutDonnees(String table,Map<String,dynamic> value) async{
    Database db=await database;
   var f= await db.insert(table,value);
    return f;
  }
  Future<void>modifier(String sql) async{
    Database db=await database;
    var f= await db.execute(sql);
  }








}