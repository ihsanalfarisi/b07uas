import 'dart:convert';
 
import 'package:b07uas/models/support.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
 
class SupportListScreen extends StatelessWidget {
  static const routeName = '/support-list';
 
  Future<List<Support>> _fetchJobs() async {
    final supportListEndpoints = 'https://pbp-b07.herokuapp.com/support-page/api/support-list';
    final response = await http.get(
      Uri.parse(supportListEndpoints),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
 
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((supports) => new Support.fromJson(supports))
          .toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
 
  Container _tile(Support support) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: ExpansionTile(
          title: Text(support.kejadian),
          expandedAlignment: Alignment.centerLeft,
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          childrenPadding: EdgeInsets.symmetric(vertical: 4.0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Negara kejadian: ${support.negara}', textAlign: TextAlign.left),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Lokasi kejadian: ${support.lokasi}', textAlign: TextAlign.left),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Keluhan: ${support.keluhan}', textAlign: TextAlign.left),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Saran: ${support.saran}', textAlign: TextAlign.left),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
 
  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index]);
        });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Formulir Keluhan")),
        body: Center(
          child: FutureBuilder<List<Support>>(
            future: _fetchJobs(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Support>? data = snapshot.data;
                return _jobsListView(data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        )
    );
  }
}