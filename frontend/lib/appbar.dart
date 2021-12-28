import 'package:flutter/material.dart';

class myAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const myAppBar({required String title}) : title = title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bande.jpg"),
                  fit: BoxFit.fill)),
        ),
        title: Text(this.title));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(48);
}
