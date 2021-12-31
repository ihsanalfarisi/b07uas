import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailSwab extends StatefulWidget {
  const DetailSwab({Key? key}) : super(key: key);
  @override
  DetailSwabState createState() => DetailSwabState();
}

class DetailSwabState extends State<DetailSwab> {
  static const namaRoute = '/swab-detail';
  late var args;
  late List<dynamic> _detailGetS;
  late List<dynamic> _dataSwab = [];
  // // In the constructor, require a Todo.
  // const DetailScreen({Key? key, required this.artikel}) : super(key: key);

  // // Declare a field that holds the Todo.
  // final Artikel artikel;
  Future<void> fetchData() async {
    args = ModalRoute.of(context)!.settings.arguments;
    String id = args["id"];
    String urlSwab =
        'https://pbp-b07.herokuapp.com/get-swabbed/swab-detail/' + id;
    // 'http://127.0.0.1:8000/get-swabbed/swab-detail/' + id;
    try {
      final responseArtikel = await http.get(
        Uri.parse(urlSwab),
        headers: <String, String>{'Content-Type': 'application/json;'},
      );
      _detailGetS = await jsonDecode(responseArtikel.body);
      print(_detailGetS.length);
      print(_detailGetS);
      _dataSwab = [];
      _detailGetS.forEach((element) {
        _dataSwab.add({
          "CountryName": element["fields"]["countryName"],
          "SwabSpot": element["fields"]["swabSpot"],
          "Address": element["fields"]["address"],
        });
      });
      print(_dataSwab);
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
            print("masuk");
            return Scaffold(
              appBar: AppBar(
                title: Text('Detail ' + id),
              ),
              body: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.white,
                      thickness: 20,
                    );
                  },
                  itemCount: _dataSwab.length,
                  itemBuilder: (context, index) {
                    return IceCreamCard(
                      cName: _dataSwab[index]["CountryName"].toString(),
                      swabSpot: _dataSwab[index]["SwabSpot"],
                      address: _dataSwab[index]["Address"],
                    );
                  }),
            );
          }
        });
  }

//sumber: https://docs.flutter.dev/cookbook/navigation/passing-data
}

class IceCreamCard extends StatelessWidget {
  const IceCreamCard({
    this.flavorColor = Colors.black87,
    this.cName = 'Judul Disini',
    this.swabSpot =
        'Deskripsi di sini, Deskripsi di sini, Deskripsi di sini, Deskripsi di sini,Deskripsi di sini, Deskripsi di sini, Deskripsi di sini, Deskripsi di sini,',
    this.address = 'https://picsum.photos/200',
  });

  final Color flavorColor;
  final String cName;
  final String swabSpot;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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
      width: 200,
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 300,
            child: Column(children: [
              Text(
                cName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: flavorColor),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                swabSpot,
                style: TextStyle(fontSize: 20.0, color: flavorColor),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                address,
                style: TextStyle(fontSize: 18.0, color: flavorColor),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
