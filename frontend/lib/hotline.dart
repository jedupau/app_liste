import 'dart:async';
import 'dart:convert';

import 'package:app_liste/commandesTraitees.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:app_liste/appbar.dart';
import 'package:app_liste/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'hotline_class.dart';
import 'form_commande.dart';
import 'utilisateur_class.dart';

class HotlinePage extends StatefulWidget {
  const HotlinePage({Key? key}) : super(key: key);

  @override
  _HotlinePageState createState() => _HotlinePageState();
}

class _HotlinePageState extends State<HotlinePage> {
  Client client = http.Client();
  List<Hotline> hotlines = [];

  Uri utilisateurUrl = Uri.parse("http://10.0.2.2:8000/utilisateur/20dupau/");
  late Future<String> livreur;
  Timer? timer;
  Utilisateur utilisateur = Utilisateur(name: "");

  Uri get_commandeTraiteeUrl() {
    String commandesTraiteeUrl = "http://10.0.2.2:8000/commandes_traitees/";
    commandesTraiteeUrl += utilisateur.commande_en_cours.toString() + "/";
    return Uri.parse(commandesTraiteeUrl);
  }

  _retrieveHotlines() async {
    hotlines = [];
    Uri retrieveUrl = Uri.parse("http://10.0.2.2:8000/hotlines/");
    List response = json.decode((await client.get(retrieveUrl)).body);
    response.forEach((element) {
      Hotline h =
          Hotline(name: element['name'], available: element['available']);
      hotlines.add(h);
    });
    setState(() {});
  }

  Future<String> _retrieveLivreur() async {
    try {
      Response r = (await http.get(get_commandeTraiteeUrl()));
      print("j'en ai maaarre" + utilisateur.commande_en_cours.toString());
      var response = json.decode(r.body);
      return response['livreur'];
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  _retrieveUtilisateur() async {
    var response = json.decode((await client.get(utilisateurUrl)).body);
    utilisateur.name = response['name'];
    if (response['commande_en_cours'] != null) {
      utilisateur.commande_en_cours = response['commande_en_cours'];
    }
  }

  assign_livreur() {
    livreur = _retrieveLivreur();
    if (livreur != null) {
      setState(() {});
      //timer?.cancel();
    }
  }

  Uri get_utilisateur_url() {
    String utilisateurUrl = "http://10.0.2.2:8000/utilisateur/";
    utilisateurUrl += utilisateur.name + "/update/";
    return Uri.parse(utilisateurUrl);
  }

  update_numCommandeUtilisateur() async {
    utilisateur.commande_en_cours = 0;
    var r = await client.put(get_utilisateur_url(), body: {
      'name': utilisateur.name,
      'commande_en_cours': json.encode(0),
    });
  }

  @override
  void initState() {
    _retrieveHotlines();
    _retrieveUtilisateur();
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) => assign_livreur());
    livreur = _retrieveLivreur();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(title: "Nos Hotlines"),
        drawer: const myDrawer(),
        body: RefreshIndicator(
            onRefresh: () async {
              _retrieveHotlines();
              _retrieveUtilisateur();
              print(utilisateur.commande_en_cours);
            },
            child: utilisateur.commande_en_cours == 0
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: hotlines.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () async {
                          if (hotlines[index].available) {
                            await FlutterPhoneDirectCaller.callNumber(
                                "01 00 00 00 00");
                          }
                        },
                        child: Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          hotlines[index].name,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("01 00 00 00 00",
                                            style: TextStyle(fontSize: 15))
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        hotlines[index].available
                                            ? "Disponible"
                                            : "Indisponible",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      decoration: BoxDecoration(
                                          color: hotlines[index].available
                                              ? Colors.green
                                              : Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () async {
                                          if (hotlines[index].available) {
                                            await FlutterPhoneDirectCaller
                                                .callNumber("01 00 00 00 00");
                                          }
                                        },
                                        child: Text("Appelez")),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CommandePage(
                                                        utilisateur:
                                                            utilisateur,
                                                      )));
                                        },
                                        child: Text("MinaEats"))
                                  ],
                                ),
                              ],
                            )),
                      );
                    })
                : FutureBuilder<String>(
                    future: livreur,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                  "MinaEats est en train de traiter votre commande ..."),
                            )
                          ],
                        );
                      } else if (snapshot.hasData) {
                        return Container(
                            child: snapshot.data == ""
                                ? CircularProgressIndicator()
                                : Center(
                                    child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(snapshot.data + " est en chemin !"),
                                      ElevatedButton(
                                          onPressed: () {
                                            update_numCommandeUtilisateur();
                                            setState(() {});
                                          },
                                          child: Text("Hotline reçue ?"))
                                    ],
                                  )));
                      } else {
                        return Container();
                      }
                    },
                  )));
  }
}

/*
 aTraiter
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        CircularProgressIndicator(),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                                "Un Minae est en train de prendre en charge votre commande ..."))
                      ])
                : Text("ok")

        */


/* : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: hotlines.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        if (hotlines[index].available) {
                          await FlutterPhoneDirectCaller.callNumber(
                              "01 00 00 00 00");
                        }
                      },
                      child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        hotlines[index].name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("01 00 00 00 00",
                                          style: TextStyle(fontSize: 15))
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      hotlines[index].available
                                          ? "Disponible"
                                          : "Indisponible",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    decoration: BoxDecoration(
                                        color: hotlines[index].available
                                            ? Colors.green
                                            : Colors.red,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: () async {
                                        if (hotlines[index].available) {
                                          await FlutterPhoneDirectCaller
                                              .callNumber("01 00 00 00 00");
                                        }
                                      },
                                      child: Text("Appelez")),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CommandePage()));
                                      },
                                      child: Text("MinaEats"))
                                ],
                              ),
                            ],
                          )),
                    );
                  }), */