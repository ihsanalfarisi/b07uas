import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/artikel/artikel_screen.dart';
import './/screens/dummy_screen.dart';
import '../screens/get_swabbed/get_swabbed_screen.dart';
import '../screens/hotel/hotel_screen.dart';
import '../screens/regulasi/regulasi_screen.dart';
import '../screens/stat/statistik_screen.dart';
import '../screens/support/support_screen.dart';
import '../screens/artikel/artikel_create2.dart';
import '../screens/artikel/artikel_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Flight',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.white,
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
        SwabbedScreen.routeName: (ctx) => SwabbedScreen(),
        HotelScreen.routeName: (ctx) => HotelScreen(),
        RegulasiScreen.routeName: (ctx) => RegulasiScreen(),
        StatScreen.routeName: (ctx) => StatScreen(),
        SupportScreen.routeName: (ctx) => SupportScreen(),
        DummyScreen.routeName: (ctx) => DummyScreen(),
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
