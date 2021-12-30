import 'dart:convert';
 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
 
class FormScreen extends StatefulWidget {
  static const routeName = '/form';
 
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}
 
class FormScreenState extends State<FormScreen> {
  late String _Negara_yang_dituju;
  late String _Lokasi_kejadian;
  late String _Kejadian_secara_umum;
  late String _Keluhan;
  late String _Saran;
 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 
  Future<void> submitForm() async {
    final response = await http.post(
        Uri.parse('https://pbp-b07.herokuapp.com/support-page/api/create-support'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          "negara": _Negara_yang_dituju,
          "lokasi": _Lokasi_kejadian,
          "kejadian": _Kejadian_secara_umum,
          "keluhan": _Keluhan,
          "saran": _Saran
        }));
    Map<String, dynamic> res = jsonDecode(response.body);
 
    AlertDialog alert = AlertDialog(
      title: Text("Form Terkirim"),
      content: Container(
        child: Text(res["message"]),
      ),
      actions: [
        TextButton(
          child: Text('Ok'),
          onPressed: () => Navigator.popAndPushNamed(context, '/support'),
        ),
      ],
    );
 
    showDialog(context: context, builder: (context) => alert);
    return;
  }
 
  Widget _buildNegara_yang_dituju() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Negara yang dituju'),
      maxLength: 1024,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Pertanyaan ini wajib diisi';
        }
 
        return null;
      },
      onSaved: (value) {
        _Negara_yang_dituju = value!;
      },
    );
  }
 
  Widget _buildLokasi_kejadian() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Lokasi Spesifik'),
      maxLength: 1024,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Pertanyaan ini wajib diisi';
        }
 
        return null;
      },
      onSaved: (value) {
        _Lokasi_kejadian = value!;
      },
    );
  }
 
  Widget _buildKejadian_secara_Umum() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Kejadian secara umum'),
      maxLength: 1024,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Pertanyaan ini wajib diisi';
        }
 
        return null;
      },
      onSaved: (value) {
        _Kejadian_secara_umum = value!;
      },
    );
  }
 
  Widget _buildKeluhan() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Keluhan'),
      maxLength: 1024,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Pertanyaan ini wajib diisi';
        }
 
        return null;
      },
      onSaved: (value) {
        _Keluhan = value!;
      },
    );
  }
 
  Widget _buildSaran() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Saran'),
      maxLength: 1024,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Pertanyaan ini wajib diisi';
        }
 
        return null;
      },
      onSaved: (value) {
        _Saran = value!;
      },
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulir Keluhan")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildNegara_yang_dituju(),
                _buildLokasi_kejadian(),
                _buildKejadian_secara_Umum(),
                _buildKeluhan(),
                _buildSaran(),
                SizedBox(height: 100),
                ElevatedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
 
                    _formKey.currentState!.save();
 
                    print(_Negara_yang_dituju);
                    print(_Lokasi_kejadian);
                    print(_Kejadian_secara_umum);
                    print(_Keluhan);
                    print(_Saran);
 
                    submitForm();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 