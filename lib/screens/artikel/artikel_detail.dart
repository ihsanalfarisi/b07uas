import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailArtikel extends StatefulWidget {
  @override
  DetailArtikelState createState() => DetailArtikelState();
}

class DetailArtikelState extends State<DetailArtikel> {
  static const namaRoute = '/detail';
  late var args;
  late List<dynamic> _reviewArtikel;
  late List<dynamic> _dataArtikel = [];
  // // In the constructor, require a Todo.
  // const DetailScreen({Key? key, required this.artikel}) : super(key: key);

  // // Declare a field that holds the Todo.
  // final Artikel artikel;
  Future<void> fetchData() async {
    args = ModalRoute.of(context)!.settings.arguments;
    String id = args["id"];
    String urlArtikel =
        'https://pbp-b07.herokuapp.com/artikel/get-detail/' + id;
    try {
      final responseArtikel = await http.get(
        Uri.parse(urlArtikel),
        headers: <String, String>{'Content-Type': 'application/json;'},
      );
      _reviewArtikel = await jsonDecode(responseArtikel.body);
      print(_reviewArtikel.length);
      print(_reviewArtikel);
      _dataArtikel = [];
      _reviewArtikel.forEach((element) {
        _dataArtikel.add({
          "id": element["pk"],
          "judul": element["fields"]["judul"],
          "gambar": element["fields"]["gambar"],
          "isi": element["fields"]["isi"],
          "deskripsi": element["fields"]["deskripsi"],
          "penulis": element["fields"]["penulis"],
          "date_published": element["fields"]["date_published"],
        });
      });
    } catch (error) {
      print("error");
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    args = ModalRoute.of(context)!.settings.arguments;
    String id = args["id"];
    print(id);
    return FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Please wait its loading...'));
          } else {
            return Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  title: Text(
                    'Artikel',
                    // artikel.judul,
                  ),
                ),
                body: SingleChildScrollView(
                    child: Center(
                        child: Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.topCenter,
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          _dataArtikel[0]["judul"],
                          // "judul",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'ditulis oleh: ' + _dataArtikel[0]["penulis"],
                        // "deskripsi",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 12.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        _dataArtikel[0]["date_published"],
                        // "deskripsi",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 12.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        _dataArtikel[0]["deskripsi"],
                        // "deskripsi",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(_dataArtikel[0]["gambar"])),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        _dataArtikel[0]["isi"],
                        // "isi",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20)),
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/artikel');
                        },
                        child: const Text('Kembali'),
                      ),
                    ],
                  ),
                ))));
          }
        });
  }

//sumber: https://docs.flutter.dev/cookbook/navigation/passing-data
}
