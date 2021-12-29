import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'search_widget.dart';

class AddCountry extends StatefulWidget {
  const AddCountry({Key? key}) : super(key: key);

  @override
  _AddCountryState createState() => _AddCountryState();
}

class _AddCountryState extends State<AddCountry> {
  String query = '';
  late var args;
  late int userID;

  late List<List<String>> countryList; // yang ditampilin di layar

  @override
  void initState() {
    super.initState();
    countryList = globals.countryList;
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          buildSearch(),
          Expanded(
            child: ListView.builder(
              itemCount: countryList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    // color: Colors.transparent,
                    margin: const EdgeInsets.all(1.0),
                    child: InkWell(
                      onTap: () async {
                        String urlAddCountry =
                            'https://pbp-b07.herokuapp.com/stat-covid/add-country/' +
                                args["userID"].toString() +
                                "/" +
                                countryList[index][0];
                        try {
                          final response =
                              await http.get(Uri.parse(urlAddCountry));
                          List<dynamic> responseJSON =
                              await jsonDecode(response.body);
                          print(responseJSON);
                          Navigator.pop(context, responseJSON[0]);
                        } catch (error) {
                          print("error add");
                          print(error);
                        }
                      },
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Hero(
                              tag: countryList[index][1],
                              child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://flagcdn.com/h240/" +
                                          countryList[index][1] +
                                          ".png")),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                countryList[index][0],
                                style: const TextStyle(
                                  fontSize: 28,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    ));
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: "Nama Negara",
        onChanged: searchCountry,
      );

  void searchCountry(String query) {
    final countryList = globals.countryList.where((country) {
      final countryName = country[0].toLowerCase();
      final search = query.toLowerCase();
      return countryName.contains(search);
    }).toList();

    setState(() {
      this.query = query;
      this.countryList = countryList;
    });
  }
}
