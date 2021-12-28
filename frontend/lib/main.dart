import 'dart:async';

import 'package:app_liste/drawer.dart';
import 'package:flutter/material.dart';
import 'package:app_liste/appbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer timer;
  int count = 0;
  String first_image = "assets/images/logo_orange.jpg";
  String second_image = "assets/images/groupe.jpg";
  String file_image = "assets/images/logo_orange.jpg";

  void change_file() {
    if (file_image == first_image) {
      file_image = second_image;
    } else {
      file_image = first_image;
    }
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(seconds: 6), (_) => setState(() => change_file()));
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const myAppBar(title: "Accueil"),
        drawer: myDrawer(),
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 2000),
                child: Image(
                  image: AssetImage(file_image),
                  key: ValueKey<String>(file_image),
                ),
                //child: Text(
                //'$count',
                //key: ValueKey<int>(count),
                //style: Theme.of(context).textTheme.headline4,
                //),
              ),
            ),
            Text(
              "Le mot de la Prez",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            Container(
                height: MediaQuery.of(context).size.width * 0.6,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/alison.jpg"),
                        fit: BoxFit.fitHeight))),
            Text(
              "blablablablablablablablbalablablablablbalbalbalblablablablablbalbalbalbalblablablablablbblablablbalblablablbalbalbalblablabb",
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
