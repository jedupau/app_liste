import 'dart:convert';

import 'package:app_liste/utilisateur_class.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:app_liste/appbar.dart';
import 'package:app_liste/drawer.dart';
import 'package:flutter/material.dart';

class CommandePage extends StatefulWidget {
  CommandePage({Key? key, required this.utilisateur}) : super(key: key);
  Utilisateur utilisateur;
  @override
  _CommandePageState createState() => _CommandePageState();
}

class _CommandePageState extends State<CommandePage> {
  Uri retrieveUrl = Uri.parse("http://10.0.2.2:8000/commandes/create/");
  Uri nbCommandesUrl = Uri.parse("http://10.0.2.2:8000/nombre_commandes/");
  Uri nbCommandesUpdateUrl =
      Uri.parse("http://10.0.2.2:8000/nombre_commandes/update/");

  late int nbCommandes;
  Client client = http.Client();
  TextEditingController LieuController = TextEditingController();
  TextEditingController HotlineController = TextEditingController();
  TextEditingController DetailsController = TextEditingController();

  Uri get_utilisateur_url() {
    String utilisateurUrl = "http://10.0.2.2:8000/utilisateur/";
    utilisateurUrl += widget.utilisateur.name + "/update/";
    print(utilisateurUrl);
    return Uri.parse(utilisateurUrl);
  }

  get_nbCommandes() async {
    List response = json.decode((await client.get(nbCommandesUrl)).body);
    nbCommandes = response[0]['nombre'];
  }

  post_commande() async {
    await client.post(retrieveUrl, body: {
      'numero': json.encode(nbCommandes + 1),
      'user': widget.utilisateur.name,
      'hotline': HotlineController.text,
      'lieu': LieuController.text,
      'details': DetailsController.text
    });
  }

  update_nbCommandes() async {
    await client.put(nbCommandesUpdateUrl,
        body: {'nombre': json.encode(nbCommandes + 1)});
  }

  update_numCommandeUtilisateur() async {
    widget.utilisateur.commande_en_cours = nbCommandes + 1;
    var r = await client.put(get_utilisateur_url(), body: {
      'name': widget.utilisateur.name,
      'commande_en_cours': json.encode(widget.utilisateur.commande_en_cours)
    });
  }

  @override
  void initState() {
    get_nbCommandes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "MinaEats"),
      drawer: myDrawer(),
      body: Column(
        children: [
          TextFormField(
            controller: HotlineController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Hotline *',
            ),
          ),
          TextFormField(
            controller: LieuController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Lieu *',
            ),
          ),
          TextFormField(
            controller: DetailsController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Details *',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                get_nbCommandes();
                post_commande();
                update_nbCommandes();
                update_numCommandeUtilisateur();
                Navigator.pop(context);
              },
              child: Text('Commandez !'))
        ],
      ),
    );
  }
}
