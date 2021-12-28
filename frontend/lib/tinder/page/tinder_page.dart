import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:app_liste/tinder/data/users.dart';
import 'package:app_liste/tinder/model/user.dart';
import 'package:app_liste/tinder/provider/feedback_position_provider.dart';
import 'package:app_liste/tinder/widget/user_card_widget.dart';
import 'package:app_liste/appbar.dart';
import 'package:app_liste/drawer.dart';

class TinderPage extends StatefulWidget {
  @override
  _TinderPageState createState() => _TinderPageState();
}

class _TinderPageState extends State<TinderPage> {
  final List<User> users = membres;
  final provider = FeedbackPositionProvider();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: myAppBar(title: "Match avec des listeux"),
        drawer: myDrawer(),
        body: Container(
          margin: const EdgeInsets.all(40),
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  "La Team",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              users.isEmpty
                  ? Text('No more users')
                  : Stack(children: users.map(buildUser).toList()),
            ],
          ),
        ),
      );

  Widget buildUser(User user) {
    final userIndex = users.indexOf(user);
    final isUserInFocus = userIndex == users.length - 1;

    return Listener(
      onPointerMove: (pointerEvent) {
        provider.updatePosition(pointerEvent.localDelta.dx);
      },
      child: Draggable(
        child: UserCardWidget(
            user: user,
            isUserInFocus: isUserInFocus,
            provider: provider,
            key: null),
        feedback: Material(
          type: MaterialType.transparency,
          child: UserCardWidget(
              user: user,
              isUserInFocus: isUserInFocus,
              provider: provider,
              key: null),
        ),
        childWhenDragging: Container(),
        onDragEnd: (details) => onDragEnd(details, user),
      ),
    );
  }

  void onDragEnd(DraggableDetails details, User user) {
    const minimumDrag = 50;
    if (details.offset.dx > minimumDrag) {
      user.isSwipedOff = true;
      setState(() {
        users.remove(user);
        users.insert(0, user);
      });
    } else if (details.offset.dx < -minimumDrag) {
      user.isLiked = true;
      setState(() {
        users.remove(user);
        users.insert(0, user);
      });
    }
    provider.resetPosition();
  }
}
