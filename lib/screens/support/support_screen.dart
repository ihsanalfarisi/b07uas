import 'package:flutter/material.dart';

import 'package:b07uas/widgets/main_drawer.dart';

class SupportScreen extends StatelessWidget {
  static const routeName = '/support';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Ini Support Screen.'),
      ),
    );
  }
}
