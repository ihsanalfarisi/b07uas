import 'package:b07uas/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class ArtikelScreen extends StatelessWidget {
  static const routeName = '/artikel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artikel'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Ini Artikel Screen.'),
      ),
    );
  }
}
