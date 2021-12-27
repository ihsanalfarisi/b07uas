import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class DummyScreen extends StatelessWidget {
  static const routeName = '/dummy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Ini Dummy Screen.'),
      ),
    );
  }
}
