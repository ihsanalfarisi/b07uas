import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class FormArtikel extends StatefulWidget {
  const FormArtikel({Key? key}) : super(key: key);
  static const namaRoute = '/tulis';
  @override
  FormArtikelState createState() => FormArtikelState();
}

class FormArtikelState extends State<FormArtikel> {
  final _formKey = GlobalKey<FormState>();

  String? judul = " ";
  String? gambar = " ";
  String? deskripsi = " ";
  String? isi = " ";

  TextEditingController judulField = TextEditingController(text: "");
  TextEditingController gambarField = TextEditingController(text: ""); //(int)
  TextEditingController deskripsiField = TextEditingController(text: "");
  TextEditingController isiField = TextEditingController(text: "");

  Future<void> submit(BuildContext context) async {
    final response = await http.post(
        Uri.parse('https://pbp-b07.herokuapp.com/artikel/create-artikel'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'judul': judulField.text,
          'gambar': gambarField.text,
          'deskripsi': deskripsiField.text,
          'isi': isiField.text,
        }));
    print(response.body);
  }

  Widget _buildJudul() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: judulField,
        decoration: new InputDecoration(
          labelText: "Judul Artikel",
          icon: Icon(Icons.text_fields),
          border:
              OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Judul artikel wajib diisi';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildGambar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: gambarField,
        decoration: new InputDecoration(
          labelText: "Gambar",
          icon: Icon(Icons.image),
          border:
              OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Gambar artikel wajib diisi';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDeskripsi() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: deskripsiField,
        decoration: new InputDecoration(
          labelText: "Deskripsi",
          icon: Icon(Icons.format_quote),
          border:
              OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Deskripsi artikel wajib diisi';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildIsi() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: isiField,
        decoration: new InputDecoration(
          labelText: "Isi",
          icon: Icon(Icons.assignment),
          border:
              OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Isi artikel wajib diisi';
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Tulis Artikel")),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildJudul(),
                  _buildGambar(),
                  _buildDeskripsi(),
                  _buildIsi(),
                  SizedBox(height: 20),
                  RaisedButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? true) {
                        showConfirmDialog(context);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }

  showConfirmDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Tidak"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget continueButton = TextButton(
      child: Text("Iya"),
      onPressed: () {
        submit(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FormArtikel()));
        showAlertDialog(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Konfirmasi"),
      content: Text("Simpan artikel?"),
      actions: [
        cancelButton,
        continueButton,
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

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.pushNamed(context, '/artikel');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Selamat!"),
      content: Text("Artikel berhasil tersimpan"),
      actions: [
        okButton,
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
}
