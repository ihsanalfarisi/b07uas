// ignore_for_file: sort_constructors_first

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../login_required.dart';
import '../user.dart' as user;
import 'globals.dart' as globals;
import 'package:intl/intl.dart';

class Loading extends StatefulWidget {
  static const routeName = '/loading';
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late var args;
  // late Map<String, dynamic> _data;
  late List<dynamic> _dataCountry;
  late List<dynamic> _cardTemplates;

  Future<void> fetchData() async {
    const urlCovid =
        'https://covid.ourworldindata.org/data/owid-covid-data.json';
    String urlCountry =
        'https://pbp-b07.herokuapp.com/stat-covid/get-country/' +
            args["userID"].toString();
    try {
      if (!globals.isFetched) {
        final responseCovid = await http.get(Uri.parse(urlCovid));
        globals.data = await jsonDecode(responseCovid.body);
        globals.isFetched = true;
      }
      final responseCountry = await http.get(Uri.parse(urlCountry));
      _dataCountry = await jsonDecode(responseCountry.body);

      var formatter = NumberFormat('###,###,000');
      _cardTemplates = [];
      _dataCountry.forEach((element) {
        dynamic dataNegara = globals.data[element["fields"]["code"]];
        // dataNegara ada
        if (dataNegara != null) {
          // data covid pada dataNegara ada
          if (dataNegara["data"] != null) {
            int length = dataNegara["data"].length;
            _cardTemplates.add({
              "id": element["pk"],
              "imageLink": "https://flagcdn.com/h240/" +
                  element["fields"]["code2"] +
                  ".png",
              "countryName": dataNegara["location"],
              "totalCases": formatter
                  .format(dataNegara["data"][length - 1]["total_cases"]),
              "lastUpdated": dataNegara["data"][length - 1]["date"],
              "alpha3": element["fields"]["code"],
              "alpha2": element["fields"]["code2"],
            });
            // data covid pada dataNegara tidak ada
          } else {
            _cardTemplates.add({
              "id": element["pk"],
              "imageLink": "https://flagcdn.com/h240/" +
                  element["fields"]["code2"] +
                  ".png",
              "countryName": dataNegara["location"],
              "totalCases": "Tidak ada",
              "lastUpdated": "Tidak ada",
              "alpha3": element["fields"]["code"],
              "alpha2": element["fields"]["code2"],
            });
          }
          // dataNegara tidak ada
        } else {
          _cardTemplates.add({
            "id": element["pk"],
            "imageLink": "https://flagcdn.com/h240/" +
                element["fields"]["code2"] +
                ".png",
            "countryName": "Tidak ada",
            "totalCases": "Tidak ada",
            "lastUpdated": "Tidak ada",
            "alpha3": element["fields"]["code"],
            "alpha2": element["fields"]["code2"],
          });
        }
      });
      Navigator.pushReplacementNamed(context, "/stat", arguments: {
        "userID": args["userID"],
        // "_data": _data,
        "_cardTemplates": _cardTemplates.reversed.toList()
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> deleteData() async {}

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments;
    if (user.user[0]['status'] == 'logged in') {
      fetchData();
    }
    return Scaffold(
      body: user.user[0]['status'] == 'logged off'
          ? Center(child: CustomDialog())
          : Container(
              child: const Center(
                  child: Image(
                image: NetworkImage(
                    "https://c.tenor.com/0iK9a1WkT40AAAAC/loading-white.gif"),
                height: 445,
                width: 400,
                fit: BoxFit.cover,
              )),
            ),
    );
  }
}
