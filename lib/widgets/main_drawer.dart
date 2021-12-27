import 'package:flutter/material.dart';

import '../screens/artikel/artikel_screen.dart';
import './/screens/dummy_screen.dart';
import '../screens/get_swabbed/get_swabbed_screen.dart';
import '../screens/hotel/hotel_screen.dart';
import '../screens/regulasi/regulasi_screen.dart';
import '../screens/stat/statistik_screen.dart';
import '../screens/support/support_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          // Container(
          //   height: 120,
          //   width: double.infinity,
          //   padding: EdgeInsets.all(20),
          //   alignment: Alignment.centerLeft,
          //   color: Theme.of(context).primaryColor,
          //   child: Text(
          //     'Safe Flight',
          //     style: TextStyle(
          //         fontWeight: FontWeight.w700,
          //         fontSize: 24,
          //         color: Colors.black),
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          UserAccountsDrawerHeader(
            accountName: Text("Magnolia Fayza"),
            accountEmail: Text("magnolia.fayza01@ui.ac.id"),
          ),
          buildListTile('Beranda', Icons.home, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Info Statistik', Icons.insert_chart, () {
            Navigator.of(context).pushReplacementNamed(StatScreen.routeName);
          }),
          buildListTile('Regulasi', Icons.fact_check, () {
            Navigator.of(context)
                .pushReplacementNamed(RegulasiScreen.routeName);
          }),
          buildListTile('Get Swabbed!', Icons.health_and_safety, () {
            Navigator.of(context).pushReplacementNamed(SwabbedScreen.routeName);
          }),
          buildListTile('Info Hotel', Icons.hotel, () {
            Navigator.of(context).pushReplacementNamed(HotelScreen.routeName);
          }),
          buildListTile('Artikel', Icons.article, () {
            Navigator.of(context).pushReplacementNamed(ArtikelScreen.routeName);
          }),
          buildListTile('Support', Icons.help, () {
            Navigator.of(context).pushReplacementNamed(SupportScreen.routeName);
          }),
          buildListTile('Dummy', Icons.assessment, () {
            Navigator.of(context).pushReplacementNamed(DummyScreen.routeName);
          }),
        ],
      ),
    );
  }
}
