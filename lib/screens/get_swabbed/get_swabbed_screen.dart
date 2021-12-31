//import 'dart:convert';
//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:b07uas/widgets/main_drawer.dart';
//import 'package:http/http.dart' as http;

class FormSwab extends StatefulWidget {
  static const routeName = '/swab';

  @override
  State<StatefulWidget> createState() {
    return FormSwabState();
  }
}

class FormSwabState extends State<FormSwab> {
  static const routeName = '/get_swabbed';

  // ignore: non_constant_identifier_names
  late String _Negara_tujuan;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Future<void> submitForm() async {
    // final response = await http.post(
    //   Uri.parse('https://pbp-b07.herokuapp.com/support-page/api/create-support'),
    //     headers: <String, String>{'Content-Type': 'application/json'},
    //     body: jsonEncode(<String, dynamic>{
    //       "negara":_Negara_tujuan,
    //     }));
    // Map<String, dynamic> res = jsonDecode(response.body);

  //   AlertDialog alert = AlertDialog(
  //     title: Text("Negara tujuan berhasil dipilih"),
  //     content: Container(
  //       //child: Text(res["message"]),
  //     ),
  //     actions: [
  //       TextButton(
  //         child: Text('Ok'),
  //         onPressed: () => Navigator.popAndPushNamed(context, '/swab-detail'),
  //       ),
  //     ],
  //   );
 
  //   showDialog(context: context, builder: (context) => alert);
  //   return;
  // }

    // ignore: non_constant_identifier_names
    Widget _buildNegara_tujuan() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Negara tujuan yang tersedia: Malaysia | Singapura | Thailand'),
        maxLength: 1024,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Negara tujuan tidak boleh kosong';
          }

          return null;
        },
        onSaved: (value) {
          _Negara_tujuan = value!;
        },
      );
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Get Swabbed"),
        ),
        drawer: const MainDrawer(),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 0.04),
                  Text('Get Swabbed!', 
                    style: TextStyle(fontSize:25.0, color: Colors.black), textAlign: TextAlign.center,),
                    Text('\nBanyak negara mengharuskan pendatang internasional melakukan tes Swab Covid-19 ketika mereka tiba di negara tersebut. Anda dapat melihat fasilitas penyedia tes Swab Covid-19 di negara tujuan dengan memanfaatkan fitur Get Swabbed! ini.\n\nPilih satu negara tujuan dari pilihan yang tersedia untuk melihat lokasi tes swab di negara tersebut.',
                    style: TextStyle(fontSize:16.0, color: Colors.black), textAlign: TextAlign.center,),
                    SizedBox(height: 0.05,),
                  _buildNegara_tujuan(),
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

                        print(_Negara_tujuan);

                        //submitForm();

                        Navigator.pushNamed(context, '/swab-detail', arguments: {
                          "id": _Negara_tujuan,
                        });
                      },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  //} //komen ini va
}