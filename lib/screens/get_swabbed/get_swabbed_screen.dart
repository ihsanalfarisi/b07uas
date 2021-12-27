import 'package:flutter/material.dart';

import 'package:b07uas/widgets/main_drawer.dart';

class SwabbedScreen extends StatelessWidget {
  static const routeName = '/swab';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Swabbed!'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Ini Regulasi Screen.'),
      ),
    );
  }
}
