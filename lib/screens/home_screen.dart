import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(height: 200),
            items: [
              Image.network(
                  'https://wowslider.com/sliders/demo-93/data1/images/sunset.jpg',
                  height: 150,
                  width: 250),
              Image.network(
                  'https://wowslider.com/sliders/demo-93/data1/images/sunset.jpg',
                  height: 50,
                  width: 250),
              Image(
                  image: NetworkImage(
                      'https://wowslider.com/sliders/demo-93/data1/images/sunset.jpg')),
              Image(
                  image: NetworkImage(
                      'https://wowslider.com/sliders/demo-93/data1/images/sunset.jpg')),
              Image(
                  image: NetworkImage(
                      'https://wowslider.com/sliders/demo-93/data1/images/sunset.jpg')),
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0), child: i));
                },
              );
            }).toList(),
          ),
          Container(
              child: Text("SAFE FLIGHT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    wordSpacing: 10,
                  ))),
          SizedBox(height: 10),
          Container(
              child: Text("Stay happy, Stay healthy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                    wordSpacing: 5,
                  ))),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            child: Text("Login Sekarang"),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    ]);
  }
}
