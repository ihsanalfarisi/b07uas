import 'package:flutter/material.dart';

import 'package:b07uas/widgets/main_drawer.dart';

class HotelScreen extends StatelessWidget {
  static const routeName = '/hotel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Hotel'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Ini Hotel Screen.'),
      ),
    );
  }
}
