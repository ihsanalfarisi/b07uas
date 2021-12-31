import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../user.dart' as user;
import 'package:b07uas/screens/login_screen.dart';

class ListArtikel extends StatefulWidget {
  @override
  ListArtikelState createState() => ListArtikelState();
}

class ListArtikelState extends State<ListArtikel> {
  static const routeName = '/artikel';
  late List<dynamic> _reviewArtikel;
  late List<dynamic> _dataArtikel = [];

  FloatingActionButton _getArtikelFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        user.user[0]['status'] == 'logged off'
            ? showAlertDialog(context)
            : Navigator.pushNamed(context, '/tulis');
      },
      child: Icon(Icons.edit),
      foregroundColor: Colors.white,
      backgroundColor: Colors.cyan,
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget backButton = TextButton(
      child: Text("Kembali"),
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/artikel');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Peringatan"),
      content: Text("Anda harus login terlebih dahulu"),
      actions: [
        backButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> fetchData() async {
    String urlArtikel = 'https://pbp-b07.herokuapp.com/artikel/get-all-artikel';
    try {
      final responseArtikel = await http.get(
        Uri.parse(urlArtikel),
        headers: <String, String>{'Content-Type': 'application/json;'},
      );
      _reviewArtikel = await jsonDecode(responseArtikel.body);
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
//FutureBuilder(future: fetchdata(), builder: (BuildContext context, AsyncSnapshot<String> snapshot) {)

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Please wait its loading...'));
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Artikel'),
              ),
              body: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.white,
                      thickness: 20,
                    );
                  },
                  itemCount: _dataArtikel.length,
                  itemBuilder: (context, index) {
                    return IceCreamCard(
                      id: _dataArtikel[index]["id"].toString(),
                      judul: _dataArtikel[index]["judul"],
                      gambar: _dataArtikel[index]["gambar"],
                      deskripsi: _dataArtikel[index]["deskripsi"],
                    );
                  }),
              floatingActionButton: _getArtikelFloatingActionButton(context),
            );
          }
        });
  }
}

// Container(color: Colors.purple, height: 530, width: 200, child: Text(index.toString()));
class IceCreamCard extends StatelessWidget {
  const IceCreamCard({
    this.flavorColor = Colors.black87,
    this.judul = 'Judul Disini',
    this.deskripsi =
        'Deskripsi di sini, Deskripsi di sini, Deskripsi di sini, Deskripsi di sini,Deskripsi di sini, Deskripsi di sini, Deskripsi di sini, Deskripsi di sini,',
    this.gambar = 'https://picsum.photos/200',
    this.id = '1',
  });

  final Color flavorColor;
  final String judul;
  final String deskripsi;
  final String gambar;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffeeeeee), width: 2.0),
        color: Colors.white38,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.white10,
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      height: 500,
      width: 200,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffeeeeee), width: 2.0),
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.white10,
                  blurRadius: 4,
                  spreadRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            height: 280,
            width: double.infinity,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(gambar),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 300,
            child: Column(children: [
              Text(
                judul,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: flavorColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                deskripsi,
                style: TextStyle(fontSize: 20.0, color: flavorColor),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.pushNamed(context, '/detail', arguments: {
                    "id": id,
                  });
                },
                child: const Text('Lihat Detail'),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
