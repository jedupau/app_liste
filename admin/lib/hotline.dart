import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'hotline_class.dart';

class HotlinePage extends StatefulWidget {
  const HotlinePage({Key? key}) : super(key: key);

  @override
  _HotlinePageState createState() => _HotlinePageState();
}

class _HotlinePageState extends State<HotlinePage> {
  Client client = http.Client();
  List<Hotline> hotlines = [];
  Uri getUrl = Uri.parse("http://10.0.2.2:8000/hotlines/");
  Uri testUrl = Uri.parse("http://10.0.2.2:8000/hotlines/update/1/");
  Uri url_update(int pk) {
    String base_url = "http://10.0.2.2:8000/hotlines/update/";
    base_url += pk.toString() + "/";
    return Uri.parse(base_url);
  }

  List<bool> list_switched = [];
  @override
  void initState() {
    _retrieveHotlines();
    super.initState();
  }

  _retrieveHotlines() async {
    hotlines = [];

    List response = json.decode((await client.get(getUrl)).body);
    response.forEach((element) {
      Hotline h = Hotline(
          id: element['id'],
          name: element['name'],
          available: element['available']);
      hotlines.add(h);
      list_switched.add(element['available']);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin - Hotlines"),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: hotlines.length,
          itemBuilder: (BuildContext context, int index) {
            return SwitchListTile(
                value: list_switched[index],
                title: Text(hotlines[index].name),
                onChanged: (bool value) {
                  client.put(url_update(hotlines[index].id), body: {
                    'name': hotlines[index].name,
                    'available': json.encode(value)
                  });
                  setState(() {
                    list_switched[index] = value;
                  });
                });
          }),
    );
  }
}
