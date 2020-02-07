import 'package:flutter/material.dart';
import 'package:gentelella_flutter_v1/widgets/app_route_observer.dart';

class GentelellaSidebar extends StatefulWidget {
  const GentelellaSidebar({@required this.permanentlyDisplay, Key key})
      : super(key: key);

  final bool permanentlyDisplay;


  @override
  _GentelellaSidebarState createState() => _GentelellaSidebarState();
}

class _GentelellaSidebarState extends State<GentelellaSidebar> with RouteAware {

  String _selectedRoute;
  AppRouteObserver _routeObserver;

  @override
  void initState() {
    super.initState();
    _routeObserver = AppRouteObserver();
  }

    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    _routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _updateSelectedRoute();
  }

  @override
  void didPop() {
    _updateSelectedRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            color: Color(0xff2A3F54),
            width: 231,
            child:
        Drawer(
          child:
          Container(
            color: Color(0xff2A3F54),
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                //padding: EdgeInsets.zero,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 130,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: Image.network(
                            "https://colorlib.com/polygon/gentelella/images/img.jpg",
                            width: 56,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Stack(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text('Welcolme, ',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xffBAB8B8))),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 48,
                                  ),
                                  Text(
                                    'John Doe',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffECF0F1)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xff2A3F54),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home, color: Color(0xffE7E7E7),),
                title: Text('Home', style: TextStyle(color: Color(0xffE7E7E7), fontSize: 14,),),
                onTap: () async{

                await _navigateTo(context, '/dashboard/');
                


//                      HomePage();
/*
                  setState(() {
                    _currentPage = 0;
                  });*/
                },
                selected: _selectedRoute == '/',
              ),
              ListTile(
                leading: const Icon(Icons.person_add, color: Color(0xffE7E7E7)),
                title: Text('Add users',style: TextStyle(color: Color(0xffE7E7E7), fontSize: 14,) ),
                onTap: () async{
                  await _navigateTo(context, '/add-users');
//                      HomePage();
                /*  setState(() {
                    _currentPage = 1;
                  });*/
                },
                selected: _selectedRoute == '/add-users',
              ),
            ],
          ),
        ),
        ),
    );
  }

  void _updateSelectedRoute() {
    setState(() {
      _selectedRoute = ModalRoute.of(context).settings.name;
    });
  }

    Future<void> _navigateTo(BuildContext context, String routeName) async {
    if (widget.permanentlyDisplay) {
      Navigator.pop(context);
    }
    await Navigator.pushNamed(context, routeName);
  }

}