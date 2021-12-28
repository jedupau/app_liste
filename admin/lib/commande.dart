import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'commande_class.dart';

class CommandePage extends StatefulWidget {
  const CommandePage({Key? key}) : super(key: key);

  @override
  _CommandePageState createState() => _CommandePageState();
}

class _CommandePageState extends State<CommandePage> {
  Client client = http.Client();
  List<Commande> commandes = [];
  Uri getUrl = Uri.parse("http://10.0.2.2:8000/commandes/");

  Uri postUrl = Uri.parse("http://10.0.2.2:8000/commandes_traitees/create/");
  List<String> listDropdownValue = [];

  Uri url_delete(int pk) {
    String base_url = "http://10.0.2.2:8000/commandes/delete/";
    base_url += pk.toString() + "/";
    return Uri.parse(base_url);
  }

  @override
  void initState() {
    _retrieveCommandes();
    super.initState();
  }

  _retrieveCommandes() async {
    commandes = [];
    listDropdownValue = [];

    List response = json.decode((await client.get(getUrl)).body);
    response.forEach((element) {
      Commande c = Commande(
          numero: element['numero'],
          id: element['id'],
          user: element['user'],
          lieu: element['lieu'],
          hotline: element['hotline'],
          details: element['details']);
      commandes.add(c);
      listDropdownValue.add('21profit');
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Admin - Commandes"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            _retrieveCommandes();
          },
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: commandes.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            commandes[index].user +
                                " - " +
                                commandes[index].hotline,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(commandes[index].lieu,
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          commandes[index].details,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DropdownButton<String>(
                            value: listDropdownValue[index],
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                listDropdownValue[index] = newValue!;
                              });
                            },
                            items: <String>[
                              '21profit',
                              '21pili',
                              '21dechelot',
                              '21cinquin',
                              '21dubail',
                              '21lepic',
                              '21basagac',
                              '21zaghroun',
                              '21touly',
                              '20chavandd',
                              '21gavaudan',
                              '21laforgue',
                              '21goubault',
                              '21riche',
                              '21schmidt',
                              '21tournier',
                              '21gentil',
                              '21celarier',
                              '21claudet',
                              '21bouchez',
                              '21leuba',
                              '20dupau',
                              '20olayachi'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                client.post(postUrl, body: {
                                  'user': commandes[index].user,
                                  'numero':
                                      json.encode(commandes[index].numero),
                                  'livreur': listDropdownValue[index],
                                  'lieu': commandes[index].lieu,
                                  'hotline': commandes[index].hotline,
                                  'details': commandes[index].details
                                });
                                client.delete(url_delete(commandes[index].id));
                                commandes.removeAt(index);
                                listDropdownValue.removeAt(index);
                                setState(() {});
                              },
                              child: Text("Envoyer listeux"))
                        ],
                      )
                    ],
                  ),
                );
              }),
        ));
  }
}
