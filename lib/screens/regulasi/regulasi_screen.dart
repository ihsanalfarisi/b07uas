import 'package:flutter/material.dart';
import 'package:b07uas/widgets/main_drawer.dart';
import 'package:b07uas/widgets/regulasi/country_form.dart';
import 'package:b07uas/screens/user.dart' as user;
import 'package:b07uas/screens/login_required.dart';

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
        body: user.user[0]['status'] == 'logged off'
            ? Center(
                child: CustomDialog()
              )
            : Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(32),
                  child: const CountryForm(),
                ),
              ));
  }
}
