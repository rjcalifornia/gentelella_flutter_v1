import 'package:flutter/material.dart';

class GentelellaAppBar extends StatefulWidget implements PreferredSizeWidget {
  GentelellaAppBar({Key key}) :  preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
   final Size preferredSize;

   @override
  _GentelellaAppBarState createState() => _GentelellaAppBarState();
}

class _GentelellaAppBarState extends State<GentelellaAppBar> {
  @override
  Widget build(BuildContext context) {
    return  AppBar(
              automaticallyImplyLeading:
                  MediaQuery.of(context).size.width < 600,
              title: Text('Gentelella Dashboard Template'),
              actions: <Widget>[IconButton(
            icon: const Icon(Icons.exit_to_app, color: Color(0xff2A3F54),),
            tooltip: 'Logout',
            onPressed: () {
             // scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),],
            );
  }
}