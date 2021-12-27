import 'package:flutter/material.dart';

import 'package:b07uas/widgets/main_drawer.dart';

class StatScreen extends StatelessWidget {
  static const routeName = '/stat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Statistik'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Ini Statistik Screen.'),
      ),
    );
  }
}
