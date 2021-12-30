import 'package:b07uas/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
 
class SupportScreen extends StatelessWidget {
  static const routeName = '/support';
 
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support'),
      ),
      drawer: MainDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: 300,
              margin: EdgeInsets.symmetric(vertical: 32.0, horizontal: 0.0),
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Text(
                    "Ada Keluhan?",
                    textAlign: TextAlign.center,
                    style: Theme.of(ctx).textTheme.headline4,
                  ),
                  SizedBox(height: 48),
                  Text(
                    'Klik tombol dibawah ini untuk melaporkan keluhanmu!',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
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
                'Lihat list keluhan',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
 
