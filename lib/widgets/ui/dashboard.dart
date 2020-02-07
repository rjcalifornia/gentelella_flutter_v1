import 'package:flutter/material.dart';
import 'package:gentelella_flutter_v1/widgets/screens/principal.dart';
import 'package:gentelella_flutter_v1/widgets/screens/add_users.dart';
import 'package:gentelella_flutter_v1/widgets/ui/gentelella_appbar.dart';
import 'package:gentelella_flutter_v1/widgets/ui/gentelella_sidebar.dart';
//import 'package:gentelella_flutter/widgets/ui/gentelella_appbar.dart';
//import 'package:gentelella_flutter/widgets/ui/sidebar.dart';

class DashboardWidget extends StatelessWidget {
  DashboardWidget ({@required this.body, @required this.pageTitle, Key key})  : super(key: key);

    final Widget body;

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const GentelellaSidebar(permanentlyDisplay: true,),
        Expanded(
          child: Scaffold(
            appBar: GentelellaAppBar(),
      
            body: body,
          ),
        ),
      ],
    );
  }
}