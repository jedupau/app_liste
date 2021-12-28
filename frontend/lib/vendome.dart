import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:app_liste/appbar.dart';
import 'package:app_liste/drawer.dart';
import 'package:better_page_turn/better_page_turn.dart';
import 'package:flutter/cupertino.dart';

class VendomePage extends StatefulWidget {
  const VendomePage({Key? key}) : super(key: key);

  @override
  _VendomePageState createState() => _VendomePageState();
}

class _VendomePageState extends State<VendomePage> {
  HorizontalFlipPageTurnController horizontalFlipPageTurnController =
      HorizontalFlipPageTurnController();
  final items = List<String>.generate(68, (i) => "$i");
  final items_bis = List<int>.generate(68, (i) => i + 1);
  int num_page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(title: "Notre Vendôme"),
        drawer: myDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  // Swiping in right direction.
                  if (details.primaryVelocity! > 0) {
                    if (num_page != 0) {
                      num_page--;
                    }
                    horizontalFlipPageTurnController.animToLeftWidget();
                  }

                  // Swiping in left direction.
                  if (details.primaryVelocity! < 0) {
                    if (num_page != 67) {
                      num_page++;
                    }
                    horizontalFlipPageTurnController.animToRightWidget();
                  }
                },
                child: LayoutBuilder(builder: (context, constraints) {
                  return HorizontalFlipPageTurn(
                    children: items.map((e) => _buildWidget(e)).toList(),
                    cellSize: Size(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height * 0.75),
                    controller: horizontalFlipPageTurnController,
                  );
                }),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(),
                height: MediaQuery.of(context).size.height * 0.05,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          int diff = num_page - index;
                          if (diff.abs() < 8) {
                            horizontalFlipPageTurnController
                                .animToPositionWidget(index,
                                    duration: Duration(milliseconds: 500));
                          } else if (diff.abs() < 30) {
                            horizontalFlipPageTurnController
                                .animToPositionWidget(index,
                                    duration: Duration(milliseconds: 200));
                          } else {
                            horizontalFlipPageTurnController
                                .animToPositionWidget(index,
                                    duration: Duration(milliseconds: 100));
                          }

                          num_page = index;
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.height * 0.05,
                          child: Container(
                            margin: EdgeInsets.only(left: 2, right: 2),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.black,
                                    Colors.orange,
                                  ]),
                            ),
                            child: Center(
                                child: Text(
                              items_bis[index].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      );
                    })),
          ],
        ));
  }

  Widget _buildWidget(String img) {
    return Image(image: AssetImage("assets/vendome/" + img + ".jpg"));
  }
}
