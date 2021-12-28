import 'package:app_liste/main.dart';
import 'package:app_liste/team.dart';
import 'package:app_liste/hotline.dart';
import 'package:app_liste/tinder/page/tinder_page.dart';
import 'package:flutter/material.dart';
import 'package:app_liste/music.dart';
import 'package:app_liste/vendome.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              child: null,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/nom.jpg"),
                      fit: BoxFit.cover))),
          Container(
            child: ListTile(
              title: const Text("Accueil"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
          ),
          Container(
            child: ListTile(
              title: const Text("La Team"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TeamPage()));
                Navigator.pop(context);
              },
            ),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
          ),
          Container(
            child: ListTile(
              title: const Text("Programme"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
          ),
          Container(
            child: ListTile(
              title: const Text("Actis"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
          ),
          Container(
            child: ListTile(
              title: const Text("Hotlines"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HotlinePage()));
              },
            ),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
          ),
          Container(
            child: ListTile(
              title: const Text("Vendôme"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VendomePage()));
              },
            ),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
          ),
          Container(
            child: ListTile(
              title: const Text("Musique"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MusicPage()));
              },
            ),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
          ),
          Container(
            child: ListTile(
              title: const Text("Vidéos"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
          ),
          Container(
            child: ListTile(
              title: const Text("Affiches"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
          ),
          Container(
            child: ListTile(
              title: const Text("Partenaires"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
          ),
        ],
      ),
    );
  }
}
