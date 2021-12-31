// ignore_for_file: prefer_const_constructors, annotate_overrides

import 'package:b07uas/screens/support/form_screen.dart';
import 'package:b07uas/screens/support/support_list_screen.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/artikel/artikel_screen.dart';
import './/screens/dummy_screen.dart';
import 'screens/get_swabbed/get_swabbed_screen.dart';
import '../screens/hotel/hotel_screen.dart';
import '../screens/regulasi/regulasi_screen.dart';
import '../screens/stat/statistik_screen.dart';
import '../screens/stat/loading.dart';
import '../screens/stat/add_country.dart';
import '../screens/stat/card_detail.dart';
import '../screens/support/support_screen.dart';
import '../screens/artikel/artikel_create2.dart';
import '../screens/artikel/artikel_detail.dart';
import 'screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeData theme = ThemeData();

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Flight',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        canvasColor: Colors.white,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        ListArtikelState.routeName: (ctx) => ListArtikel(),
        FormArtikel.namaRoute: (context) => FormArtikel(),
        DetailArtikelState.namaRoute: (context) => DetailArtikel(),
        FormSwabState.routeName: (ctx) => FormSwab(),
        HotelScreen.routeName: (ctx) => HotelScreen(),
        RegulasiScreen.routeName: (ctx) => RegulasiScreen(),
        StatScreen.routeName: (ctx) => StatScreen(),
        Loading.routeName: (ctx) => Loading(),
        '/add-country': (context) => AddCountry(),
        '/card-detail': (context) => CardDetail(),
        SupportScreen.routeName: (ctx) => SupportScreen(),
        DummyScreen.routeName: (ctx) => DummyScreen(),
        LoginPage.routeName: (ctx) => LoginPage(),
        FormScreen.routeName: (ctx) => FormScreen(),
        SupportListScreen.routeName: (ctx) => SupportListScreen(),
      },
      // ignore: missing_return
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => HomeScreen(),
        );
      },
    );
  }
}
