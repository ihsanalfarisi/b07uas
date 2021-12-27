import 'package:flutter/material.dart';

import 'package:b07uas/widgets/main_drawer.dart';

class RegulasiScreen extends StatelessWidget {
  static const routeName = '/regulasi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Regulasi'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Ini Regulasi Screen.'),
      ),
    );
  }
}
