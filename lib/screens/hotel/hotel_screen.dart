import 'package:flutter/material.dart';

import 'package:b07uas/widgets/main_drawer.dart';
import 'hotel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HotelScreen extends StatefulWidget {
  static const routeName = '/hotel';

  const HotelScreen({Key? key}) : super(key: key);

  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _Negara;
  List<Hotel> list = [];
  var isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get(Uri.parse("https://pbp-b07.herokuapp.com/hotel/json"));
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Hotel.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load hotels');
    }
  }

  Widget _buildNegara() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Pilih Negara',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
      maxLength: 1024,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Pertanyaan ini wajib diisi';
        }

        return null;
      },
      onSaved: (String? value) {
        _Negara = value!;
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget _HotelIndonesia() {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Hotel Karantina Terbaik di ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0,
                    wordSpacing: 3,
                  )),
              const SizedBox(
                width: 3,
              ),
              const Text("Indonesia",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0,
                    wordSpacing: 3,
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (list[index].country! == 'Indonesia') {
                          return Card(
                            child: ListTile(
                              leading: Image.network(list[index].foto!),
                              title: Text(list[index].namaHotel!),
                              subtitle: Text('Harga: ' + list[index].harga!),
                              trailing: Icon(Icons.more_vert),
                              isThreeLine: true,
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: 0.1,
                          );
                        }
                      }),
                ),
        )
      ],
    );
  }

  Widget _HotelSingapore() {
    return Column(children: [
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hotel Karantina Terbaik di ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0,
                  wordSpacing: 3,
                )),
            const SizedBox(
              width: 3,
            ),
            const Text("Singapore",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0,
                  wordSpacing: 3,
                ))
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (list[index].country! == 'Singapore') {
                        return Card(
                          child: ListTile(
                            leading: Image.network(list[index].foto!),
                            title: Text(list[index].namaHotel!),
                            subtitle: Text('Harga: ' + list[index].harga!),
                            trailing: Icon(Icons.more_vert),
                            isThreeLine: true,
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: 0.1,
                        );
                      }
                    }),
              ),
      )
    ]);
  }

  Widget _HotelMalaysia() {
    return Column(children: [
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hotel Karantina Terbaik di ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0,
                  wordSpacing: 3,
                )),
            const SizedBox(
              width: 3,
            ),
            const Text("Malaysia",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0,
                  wordSpacing: 3,
                ))
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (list[index].country! == 'Malaysia') {
                        return Card(
                          child: ListTile(
                            leading: Image.network(list[index].foto!),
                            title: Text(list[index].namaHotel!),
                            subtitle: Text('Harga: ' + list[index].harga!),
                            trailing: Icon(Icons.more_vert),
                            isThreeLine: true,
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: 0.1,
                        );
                      }
                    }),
              ),
      )
    ]);
  }

  Widget _HotelThailand() {
    return Column(children: [
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hotel Karantina Terbaik di ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0,
                  wordSpacing: 3,
                )),
            const SizedBox(
              width: 3,
            ),
            const Text("Thailand",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0,
                  wordSpacing: 3,
                ))
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (list[index].country! == 'Thailand') {
                        return Card(
                          child: ListTile(
                            leading: Image.network(list[index].foto!),
                            title: Text(list[index].namaHotel!),
                            subtitle: Text('Harga: ' + list[index].harga!),
                            trailing: Icon(Icons.more_vert),
                            isThreeLine: true,
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: 0.1,
                        );
                      }
                    }),
              ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("Info Hotel Karantina")),
          body: SingleChildScrollView(
              child: Container(
                  margin: const EdgeInsets.all(24),
                  child: Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                "Temukan hotel karantina terbaik di negara tujuanmu! \nKenyamananmu adalah prioritas kami.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            SizedBox(height: 10),
                            Text("Cari hotel karantina di negara berikut:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )),
                            Text("Singapore | Malaysia | Thailand | Indonesia",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            _buildNegara(),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                _fetchData();
                                _formKey.currentState!.save();
                                print(_Negara);
                                setState(() {});
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                                child: _Negara == "Indonesia"
                                    ? _HotelIndonesia()
                                    : _Negara == "Singapore"
                                        ? _HotelSingapore()
                                        : _Negara == "Malaysia"
                                            ? _HotelMalaysia()
                                            : _Negara == "Thailand"
                                                ? _HotelThailand()
                                                // ? FetchHotelThai()
                                                : null),
                          ]))))),
    );
  }
}
