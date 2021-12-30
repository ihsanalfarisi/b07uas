import 'package:flutter/material.dart';
import 'package:b07uas/widgets/main_drawer.dart';
import 'package:b07uas/widgets/regulasi/country_form.dart';

class RegulasiScreen extends StatelessWidget {
  static const routeName = '/regulasi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Regulasi'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: const CountryForm(),
        ),
      )
    );
  }
}
