import 'package:b07uas/screens/stat/loading.dart';
import 'package:flutter/material.dart';

import '../screens/artikel/artikel_screen.dart';
import './/screens/dummy_screen.dart';
import '../screens/get_swabbed/get_swabbed_screen.dart';
import '../screens/hotel/hotel_screen.dart';
import '../screens/regulasi/regulasi_screen.dart';
import '../screens/support/support_screen.dart';
import '../screens/user.dart' as user;

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  Widget _logout() {
    return buildListTile('Logout', Icons.logout, () {
      user.user.insert(0, {'status': "logged off", "userID": -1});
      print(user.user[0]['status']);
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            child: user.user[0]['status'] == 'logged off'
                ? Container(
                    decoration: BoxDecoration(color: Colors.cyan),
                    child: Column(children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text("Safe Flight",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                            wordSpacing: 5,
                          )),
                      SizedBox(height: 50),
                    ]))
                : UserAccountsDrawerHeader(
                    accountName: Text(user.user[0]['username']),
                    accountEmail: Text(user.user[0]['email']),
                  ),
          ),
          buildListTile('Beranda', Icons.home, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Info Statistik', Icons.insert_chart, () {
            // karena login belom ada userID nya 1 dulu
            Navigator.of(context).pushReplacementNamed(Loading.routeName,
                arguments: {
                  "userID": user.user[0]['userID'],
                  "task": "fetchData"
                });
          }),
          buildListTile('Regulasi', Icons.fact_check, () {
            Navigator.of(context)
                .pushReplacementNamed(RegulasiScreen.routeName);
          }),
          buildListTile('Get Swabbed!', Icons.health_and_safety, () {
            Navigator.of(context).pushReplacementNamed(FormSwabState.routeName);
          }),
          buildListTile('Info Hotel', Icons.hotel, () {
            Navigator.of(context).pushReplacementNamed(HotelScreen.routeName);
          }),
          buildListTile('Artikel', Icons.article, () {
            Navigator.of(context).pushNamed(ListArtikelState.routeName);
          }),
          buildListTile('Support', Icons.help, () {
            Navigator.of(context).pushReplacementNamed(SupportScreen.routeName);
          }),
          buildListTile('Dummy', Icons.assessment, () {
            Navigator.of(context).pushReplacementNamed(DummyScreen.routeName);
          }),
          Container(
              child: user.user[0]['status'] == 'logged off' ? null : _logout())
        ],
      ),
    );
  }
}
