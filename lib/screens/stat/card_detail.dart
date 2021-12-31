import 'package:flutter/material.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

class CardDetail extends StatefulWidget {
  const CardDetail({Key? key}) : super(key: key);

  @override
  _CardDetailState createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  late var args;
  late WebViewController controller;
  bool kasusPositif = false;
  bool vaksinasi = true;
  bool kasusKematian = true;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      floatingActionButton: PopupMenuButton(
        iconSize: 40.0,
        icon: const Icon(
          Icons.menu,
          color: Colors.blue,
        ),
        itemBuilder: (context) => <PopupMenuEntry>[
          PopupMenuItem(
            enabled: kasusPositif,
            child: const Text("Kasus Positif"),
            onTap: () {
              setState(() {
                kasusPositif = false;
                vaksinasi = true;
                kasusKematian = true;
                controller.loadUrl(
                    "https://ourworldindata.org/explorers/coronavirus-data-explorer?zoomToSelection=true&facet=none&pickerSort=asc&pickerMetric=location&hideControls=true&Interval=7-day+rolling+average&Relative+to+Population=true&Align+outbreaks=false&country=~${args["alpha3"]}&Metric=Confirmed+cases");
              });
            },
          ),
          PopupMenuItem(
            enabled: vaksinasi,
            child: const Text("Vaksinasi"),
            onTap: () {
              setState(() {
                kasusPositif = true;
                vaksinasi = false;
                kasusKematian = true;
                controller.loadUrl(
                    "https://ourworldindata.org/explorers/coronavirus-data-explorer?zoomToSelection=true&facet=none&pickerSort=asc&pickerMetric=location&hideControls=true&Interval=7-day+rolling+average&Relative+to+Population=true&Align+outbreaks=false&country=~${args["alpha3"]}&Metric=People+vaccinated");
              });
            },
          ),
          PopupMenuItem(
            enabled: kasusKematian,
            child: const Text("Kasus Kematian"),
            onTap: () {
              setState(() {
                kasusPositif = true;
                vaksinasi = true;
                kasusKematian = false;
                controller.loadUrl(
                    "https://ourworldindata.org/explorers/coronavirus-data-explorer?zoomToSelection=true&facet=none&pickerSort=asc&pickerMetric=location&hideControls=true&Interval=7-day+rolling+average&Relative+to+Population=true&Align+outbreaks=false&country=~${args["alpha3"]}&Metric=Confirmed+deaths");
              });
            },
          ),
          PopupMenuItem(
            child: const Text("Back"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: WebView(
          onWebViewCreated: (WebViewController webViewController) {
            controller = webViewController;
          },
          initialUrl:
              "https://ourworldindata.org/explorers/coronavirus-data-explorer?zoomToSelection=true&facet=none&pickerSort=asc&pickerMetric=location&hideControls=true&Interval=7-day+rolling+average&Relative+to+Population=true&Align+outbreaks=false&country=~${args["alpha3"]}&Metric=Confirmed+cases",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
