// ignore_for_file: sort_constructors_first, non_constant_identifier_names, only_throw_errors

import 'package:flutter/material.dart';
import 'package:b07uas/widgets/main_drawer.dart';
import 'hotel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:b07uas/screens/user.dart' as user;
import 'package:b07uas/screens/login_required.dart';
import 'package:url_launcher/url_launcher.dart';

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
  Future<void>? _launched;

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

  Widget _buildForm() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Pilih Negara',
        hintText: "Contoh: Singapore",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
      maxLength: 50,
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

  Future<void> _launchInWebViewOrVC(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  _launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _HotelCard(String? country) {
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
            Text('$country',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.cyan,
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
                      if (list[index].country! == country) {
                        return Card(
                          child: ListTile(
                            onTap: () => setState(() {
                              _launched =
                                  _launchInWebViewOrVC(list[index].detail!);
                            }),
                            // onTap: _launchURL,
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
    return Scaffold(
      appBar: AppBar(title: const Text("Info Hotel Karantina")),
      drawer: MainDrawer(),
      body: user.user[0]['status'] == 'logged off'
          ? Center(child: CustomDialog())
          : SingleChildScrollView(
              child: Container(
                  margin: const EdgeInsets.all(24),
                  child: Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Info Hotel Karantina",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                )),
                            SizedBox(height: 10),
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
                            const SizedBox(height: 10),
                            _buildForm(),
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
                                child: (_Negara == "Indonesia" ||
                                        _Negara == "Singapore" ||
                                        _Negara == "Malaysia" ||
                                        _Negara == "Thailand")
                                    ? _HotelCard(_Negara)
                                    : _Negara != null
                                        ? Text("Harap ketik negara yang sesuai")
                                        : null),
                          ])))),
    );
  }
}
