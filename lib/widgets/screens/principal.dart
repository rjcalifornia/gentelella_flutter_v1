import 'package:flutter/material.dart';
import 'package:gentelella_flutter_v1/api/users_list_api.dart';
import 'package:gentelella_flutter_v1/models/users.dart';
import 'package:gentelella_flutter_v1/widgets/ui/dashboard.dart';
import 'dart:async';
import 'dart:convert';

import 'package:gentelella_flutter_v1/widgets/ui/gentelella_appbar.dart';

class HomePage extends StatefulWidget {
  // name({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    //var activeUsers = new List<UsersModel>();
    List<UsersModel> _activeUsers;
    Timer timer;
    int counter = 0;
    
    Future _getFromApi() async {
    UsersList.getActiveUsers().then((response) {

      var list = json.decode(response.body);
        List<UsersModel> activeUsers = [];
        for(var u in list)
        {
          UsersModel users = UsersModel(u['id'], u['name'], u['username'], u['email'],u['phone']);
          activeUsers.add(users);
         // print(users.id);

          //      PetrolItem petrol = PetrolItem(u["logo"], u["location"], u["distance"], u["price"], u["facilities"]);

        }
      setState(() {
        

        _activeUsers = activeUsers;
        //activeUsers = list.map((model) => UsersModel.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getFromApi();
    _activeUsers = [];
    timer = Timer.periodic(Duration(seconds: 100), (Timer t) => _getFromApi());

  }



  @override
  Widget build(BuildContext context) {
    return DashboardWidget(
      pageTitle: '',
     // appBar: GentelellaAppBar(),
      body: SingleChildScrollView(child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            bottom: 25,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[400],
                                    blurRadius: 5.0,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child: Image.network(
                                          "https://cdn.pixabay.com/photo/2018/03/10/18/03/laptop-3214756_1280.png",
                                          fit: BoxFit.cover,
                                        ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                   
                    
                  ],
                ),
          ),


Container(
             //height: MediaQuery.of(context).size.height / 30,
            width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Active users list', style: TextStyle(color: Color(0xff73879C), fontWeight: FontWeight.w500, fontSize: 26.0,),),
                     //Text('Active users list', style: TextStyle(color: Color(0xff73879C), fontWeight: FontWeight.w500, fontSize: 26.0,),),
                  ]
                )
),
          

          Container(
             //height: MediaQuery.of(context).size.height / 1,
            width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
 Container(
    width: double.infinity,
             color: Color(0xffffffff),
             padding:  EdgeInsets.symmetric(vertical: 35.0, horizontal: 35.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: <Widget>[
                 Text('Users added',
                 style: TextStyle(color: Color(0xff73879C), fontSize: 18.0, fontWeight: FontWeight.w100),
                 ),
                 Divider(),
                 Text('A list of all users added to the database',
                 style: TextStyle(color: Color(0xff73879C), fontSize: 12.0, fontWeight: FontWeight.w100),
                 ),
                 
                  DataTable(
             columns: [
               DataColumn(label: Text('ID')),
               DataColumn(label: Text('Name')),
               DataColumn(label: Text('Username')),
               DataColumn(label: Text('Email')),
               DataColumn(label: Text('Phone Number'))
             ],
             rows:
                _activeUsers
               .map(
                 ((user) => DataRow(
                   cells: [
                     DataCell(Text('${user.id}')),
                   DataCell(Text('${user.name}')),
                   DataCell(Text('${user.userName}')),
                   DataCell(Text('${user.email}')),
                   DataCell(Text('${user.phone}')),
                   ],
                 )),
               ).toList(),
                     ),
               ],

             )
                    

               /*
              DataRow(
                 cells: [
                   DataCell(Text('Acme Electric Company')),
                   DataCell(Text('WS-78889')),
                   DataCell(Text('550.00')),
                 ]
               ),
               DataRow(
                 cells: [
                   DataCell(Text('Water Utility Company')),
                   DataCell(Text('AP-RT880')),
                   DataCell(Text('50.00')),
                 ]
               )*/
             
           ),

                  ],
                ),
          ),


          SizedBox(height: 50,)

           
          

        ],
      ),
    ),
    );
  
  }
}
