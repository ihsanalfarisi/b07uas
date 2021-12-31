import 'package:b07uas/screens/artikel/artikel_screen.dart';
import 'package:b07uas/screens/get_swabbed/get_swabbed_screen.dart';
import 'package:b07uas/screens/hotel/hotel_screen.dart';
import 'package:b07uas/screens/regulasi/regulasi_screen.dart';
import 'package:b07uas/screens/stat/loading.dart';
import 'package:b07uas/screens/user.dart' as user;
import 'package:flutter/material.dart';

class FiturScreen extends StatelessWidget {
  static const routeName = '/fitur';

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          SizedBox(height: 20),
          Container(
            child: Column(
              children: [
                Container(
                  child: Text("SEPUTAR FITUR",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                        wordSpacing: 10,
                      )),
                ),
                SizedBox(height: 20),
                Center(
                  child: Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(
                            Loading.routeName,
                            arguments: {
                              "userID": user.user[0]['userID'],
                              "taks": "fetchData"
                            });
                      },
                      child: SizedBox(
                        width: 300,
                        height: 100,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Info Statistik',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  wordSpacing: 5,
                                )),
                          ),
                          SizedBox(height: 10),
                          Text(
                              'Kumpulan statistik mengenai jumlah kasus, vaksin, dan kematian akibat COVID-19 pada berbagai negara',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1,
                                wordSpacing: 5,
                              )),
                        ]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RegulasiScreen.routeName);
                      },
                      child: SizedBox(
                        width: 300,
                        height: 100,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Regulasi',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  wordSpacing: 5,
                                )),
                          ),
                          SizedBox(height: 10),
                          Text(
                              'Kumpulan informasi mengenai kebijakan dan persyaratan untuk mengunjungi negara destinasi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1,
                                wordSpacing: 5,
                              )),
                        ]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(FormSwabState.routeName);
                      },
                      child: SizedBox(
                        width: 300,
                        height: 100,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Get Swabbed!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  wordSpacing: 5,
                                )),
                          ),
                          SizedBox(height: 10),
                          Text(
                              'Menyediakan daftar fasilitas tes covid-19 terdekat dari bandara utama di negara tujuan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1,
                                wordSpacing: 5,
                              )),
                        ]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(HotelScreen.routeName);
                      },
                      child: SizedBox(
                        width: 300,
                        height: 100,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Info Hotel Karantina',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  wordSpacing: 5,
                                )),
                          ),
                          SizedBox(height: 10),
                          Text(
                              'Temukan hotel karantina terbaik di negara tujuanmu! Kenyamananmu adalah prioritas kami',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1,
                                wordSpacing: 5,
                              )),
                        ]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(ListArtikelState.routeName);
                      },
                      child: SizedBox(
                        width: 300,
                        height: 100,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Artikel',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  wordSpacing: 5,
                                )),
                          ),
                          SizedBox(height: 10),
                          Text(
                              'Artikel dan penulisan artikel terkait traveling saat pandemi.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1,
                                wordSpacing: 5,
                              )),
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}
