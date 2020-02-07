import 'package:flutter/material.dart';

import 'package:gentelella_flutter_v1/widgets/ui/dashboard.dart';
import 'package:gentelella_flutter_v1/widgets/ui/gentelella_appbar.dart';

class ReceiptForm extends StatefulWidget {
  ReceiptForm({Key key}) : super(key: key);

  @override
  _ReceiptFormState createState() => _ReceiptFormState();
}

class _ReceiptFormState extends State<ReceiptForm> {
  @override
  Widget build(BuildContext context) {
    return DashboardWidget(
      pageTitle: '',
      //appBar: GentelellaAppBar(),
      body: SingleChildScrollView(
        child:
        Column(
          children: <Widget>[
            Text('Add new user page'),
          ],
        ),),
    );
  }
}