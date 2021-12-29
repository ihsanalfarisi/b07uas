import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {
  final int id;
  final String imageLink;
  final String countryName;
  final String totalCases;
  final String lastUpdated;
  final String alpha3;
  final String alpha2;

  const CardTemplate({
    Key? key,
    required this.id,
    required this.imageLink,
    required this.countryName,
    required this.totalCases,
    required this.lastUpdated,
    required this.alpha3,
    required this.alpha2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: alpha2,
            child: Image(
              image: NetworkImage(imageLink),
              height: 245,
              width: 400,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "$countryName\n",
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                const Text(
                  "Kasus Virus Corona:",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  "$totalCases\n\n",
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  "Terakhir diperbarui: $lastUpdated",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/card-detail", arguments: {
                  "alpha3": alpha3,
                });
              },
              child: const Text('Detail'),
            ),
          )
        ],
      ),
    );
  }
}
