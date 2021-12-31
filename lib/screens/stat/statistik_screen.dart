// ignore_for_file: sort_constructors_first

import 'package:b07uas/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'card_template.dart';
import 'package:intl/intl.dart';
import 'globals.dart' as globals;

import 'package:http/http.dart' as http;

class StatScreen extends StatefulWidget {
  static const routeName = '/stat';

  const StatScreen({Key? key}) : super(key: key);

  @override
  State<StatScreen> createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  late var args;
  late List<dynamic> _cardTemplates;
  late int userID;
  late double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments;
    _cardTemplates = args["_cardTemplates"];
    userID = args["userID"];
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      floatingActionButton: Opacity(
        opacity: opacity,
        child: DragTarget<int>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return const Icon(
              Icons.delete,
              color: Colors.red,
              size: 70.0,
            );
          },
          onAccept: (data) {
            setState(() {
              for (var i = 0; i < _cardTemplates.length; i++) {
                if (_cardTemplates[i]["id"] == data) {
                  String urlDeleteCountry =
                      'https://pbp-b07.herokuapp.com/stat-covid/delete-country/$data';
                  http.get(Uri.parse(urlDeleteCountry));
                  _cardTemplates.removeAt(i);
                  break;
                }
              }
            });
          },
        ),
      ),
      appBar: AppBar(
        title: const Text('Info Statistik'),
      ),
      drawer: const MainDrawer(),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Dapatkan statistik COVID-19 di negara manapun yang ingin anda kunjungi",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Tambah Negara",
                  style: TextStyle(fontSize: 22.0),
                ),
                IconButton(
                  onPressed: () async {
                    try {
                      final responseJSON = await Navigator.pushNamed(
                        context,
                        "/add-country",
                        arguments: {
                          "userID": userID,
                        },
                      ) as Map;
                      setState(() {
                        var formatter = NumberFormat('###,###,000');
                        dynamic dataNegara =
                            globals.data[responseJSON["fields"]["code"]];
                        // dataNegara ada
                        if (dataNegara != null) {
                          // data covid pada dataNegara ada
                          if (dataNegara["data"] != null) {
                            int length = dataNegara["data"].length;
                            _cardTemplates.insert(0, {
                              "id": responseJSON["pk"],
                              "imageLink": "https://flagcdn.com/h240/" +
                                  responseJSON["fields"]["code2"] +
                                  ".png",
                              "countryName": dataNegara["location"],
                              "totalCases": formatter.format(dataNegara["data"]
                                  [length - 1]["total_cases"]),
                              "lastUpdated": dataNegara["data"][length - 1]
                                  ["date"],
                              "alpha3": responseJSON["fields"]["code"],
                              "alpha2": responseJSON["fields"]["code2"],
                            });
                            // data covid pada dataNegara tidak ada
                          } else {
                            _cardTemplates.insert(0, {
                              "id": responseJSON["pk"],
                              "imageLink": "https://flagcdn.com/h240/" +
                                  responseJSON["fields"]["code2"] +
                                  ".png",
                              "countryName": dataNegara["location"],
                              "totalCases": "Tidak ada",
                              "lastUpdated": "Tidak ada",
                              "alpha3": responseJSON["fields"]["code"],
                              "alpha2": responseJSON["fields"]["code2"],
                            });
                          }
                          // dataNegara tidak ada
                        } else {
                          _cardTemplates.insert(0, {
                            "id": responseJSON["pk"],
                            "imageLink": "https://flagcdn.com/h240/" +
                                responseJSON["fields"]["code2"] +
                                ".png",
                            "countryName": "Tidak ada",
                            "totalCases": "Tidak ada",
                            "lastUpdated": "Tidak ada",
                            "alpha3": responseJSON["fields"]["code"],
                            "alpha2": responseJSON["fields"]["code2"],
                          });
                        }

                        // --
                      });
                    } catch (error) {
                      print(error);
                    }
                  },
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ],
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: 550,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _cardTemplates.length,
              itemBuilder: (BuildContext context, int index) {
                return LongPressDraggable<int>(
                  onDragStarted: () {
                    setState(() {
                      opacity = 1.0;
                    });
                  },
                  onDragEnd: (details) {
                    setState(() {
                      opacity = 0.0;
                    });
                  },
                  data: _cardTemplates[index]["id"],
                  childWhenDragging: const Card(),
                  feedback: CardTemplate(
                    id: _cardTemplates[index]["id"],
                    imageLink: _cardTemplates[index]["imageLink"],
                    countryName: _cardTemplates[index]["countryName"],
                    totalCases: _cardTemplates[index]["totalCases"],
                    lastUpdated: _cardTemplates[index]["lastUpdated"],
                    alpha3: _cardTemplates[index]["alpha3"],
                    alpha2: _cardTemplates[index]["alpha2"],
                  ),
                  child: CardTemplate(
                    id: _cardTemplates[index]["id"],
                    imageLink: _cardTemplates[index]["imageLink"],
                    countryName: _cardTemplates[index]["countryName"],
                    totalCases: _cardTemplates[index]["totalCases"],
                    lastUpdated: _cardTemplates[index]["lastUpdated"],
                    alpha3: _cardTemplates[index]["alpha3"],
                    alpha2: _cardTemplates[index]["alpha2"],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
