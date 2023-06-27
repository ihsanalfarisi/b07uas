import 'package:flutter/material.dart';
import 'package:b07uas/models/regulasi_country.dart';
import 'package:b07uas/models/regulasi_data.dart' as data;
import 'package:b07uas/screens/regulasi/regulasi_detail.dart';

class CountryForm extends StatefulWidget {
  const CountryForm({Key? key}) : super(key: key);

  @override
  _CountryFormState createState() => _CountryFormState();
}

class _CountryFormState extends State<CountryForm> {
  TextEditingController negara = new TextEditingController();
  List<Country> countryList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: 7,
        ),
        Text("Info Regulasi\n",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            textAlign: TextAlign.center),
        Text("Cari tahu mengenai regulasi Covid-19 negara destinasimu disini!\n",
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center),
        Text("Pilihan negara: Malaysia, Singapore, Thailand",
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: TextFormField(
            controller: negara,
            validator: (controller) {
              if (controller == null) {
                return 'Pertanyaan ini wajib diisi';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Ketik untuk mencari",
              labelText: "Nama negara",
              contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
            backgroundColor: Colors.blue,
            onbackgroundColor: Colors.white,
            padding: EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0)),
          ),
          onPressed: () async {
            final country = data.contents.where((element) =>
                element.country.toLowerCase().toString() ==
                negara.text.toLowerCase().toString());

            print(country.length);

            if (country.isNotEmpty) {
              final findCountryNameInCountryList = countryList.where(
                  (element) =>
                      element.name.toString().toLowerCase() ==
                      negara.text.toLowerCase().toString());

              if (findCountryNameInCountryList.isEmpty) {
                setState(() {
                  countryList.add(
                    Country(
                      name: country.first.country,
                    ),
                  );
                });
              }
            }
          },
          child: const Text('Pilih'),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.42,
          child: ListView.builder(
            itemCount: countryList.length,
            itemBuilder: (BuildContext context, int i) {
              return Container(
                margin: EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        countryList.removeAt(i);
                      });
                    },
                    splashColor: Colors.blue,
                  ),
                  title: Text(
                    countryList[i].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.double_arrow,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => RegulateDetailScreen(
                              country: countryList[i].name
                            ),
                    );
                    Navigator.push(context, route);
                  },
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}
