import 'package:b07uas/screens/login_required.dart';
import 'package:b07uas/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:b07uas/screens/user.dart' as user;
 
class SupportScreen extends StatelessWidget {
  static const routeName = '/support';
 
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support'),
      ),
      drawer: MainDrawer(),
      body:
      user.user[0]['status'] == 'logged off'
      ? Center(
        child: CustomDialog()
      )
      : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: 300,
              margin: EdgeInsets.symmetric(vertical: 60.0, horizontal: 0.0),
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Text("Ada Keluhan?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center),
                  SizedBox(height: 20),
                  Text("Klik tombol dibawah ini untuk melaporkan keluhanmu!",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center),
              ])),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(ctx, '/form');
              },
              child: Text(
                'Isi Form',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(ctx, '/support-list');
              },
              child: Text(
                'Lihat List Keluhan',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
 
