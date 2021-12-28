import 'package:app_liste/tinder/page/tinder_page.dart';
import 'package:flutter/material.dart';
import 'package:app_liste/appbar.dart';
import 'package:app_liste/drawer.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const myAppBar(title: "La Team"),
      drawer: myDrawer(),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TinderPage()));
              },
              child: const Text("Match avec nos listeux !")),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: ListTile(
              title: Text(
                "Le Bureau",
                style: TextStyle(fontSize: 30),
              ),
            ),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21profit.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 20, right: 10),
              ),
              Text("Description Alison"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Description Pili"),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21pili.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 10, right: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21dechelot.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 20, right: 10),
              ),
              Text("Description Théophile"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Description Alizée"),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21cinquin.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 10, right: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21dubail.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 20, right: 10),
              ),
              Text("Description Simon"),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: ListTile(
              title: Text(
                "Pôle Interne",
                style: TextStyle(fontSize: 30),
              ),
            ),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21gavaudan.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 20, right: 10),
              ),
              Text("Description Gavau"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Description Laforgue"),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21laforgue.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 10, right: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21goubault.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 20, right: 10),
              ),
              Text("Description Goubault"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Description Riché"),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21riche.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 10, right: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21schmidt.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 20, right: 10),
              ),
              Text("Description Tim"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Description Olympe"),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21tournier.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 10, right: 20),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: ListTile(
              title: Text(
                "Pôle Externe",
                style: TextStyle(fontSize: 30),
              ),
            ),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21gentil.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 20, right: 10),
              ),
              Text("Description Lucas"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Description Victoire"),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21celarier.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 10, right: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21claudet.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 20, right: 10),
              ),
              Text("Description Claudet"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Description Marion"),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21bouchez.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 10, right: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21leuba.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 20, right: 10),
              ),
              Text("Description Athanase"),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: ListTile(
              title: Text(
                "Pôle Entreprise",
                style: TextStyle(fontSize: 30),
              ),
            ),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21lepic.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 20, right: 10),
              ),
              Text("Description Ludo"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Description Mehmet"),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21basagac.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 10, right: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21zaghroun.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 20, right: 10),
              ),
              Text("Description Zagh"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Description Touly"),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/21touly.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 10, right: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/20chavandd.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 20, right: 10),
              ),
              Text("Description Pauline"),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: ListTile(
              title: Text(
                "Soutiens",
                style: TextStyle(fontSize: 30),
              ),
            ),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/20dupau.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 20, right: 10),
              ),
              Text("Description JE"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Description Aldair"),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/20olayachi.jpg'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(left: 10, right: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
