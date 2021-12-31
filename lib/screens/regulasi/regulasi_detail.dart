// ignore_for_file: sort_constructors_first

import 'package:flutter/material.dart';
import 'package:b07uas/models/regulasi_data.dart' as data;

class RegulateDetailScreen extends StatefulWidget {
  final String country;

  RegulateDetailScreen({
    required this.country,
  });

  @override
  _RegulateDetailScreenState createState() => _RegulateDetailScreenState();
}

class _RegulateDetailScreenState extends State<RegulateDetailScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.country);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Regulasi ${widget.country}'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
            child: (widget.country == 'Malaysia')
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "MALAYSIA",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Text(
                          'Sebelum berangkat ke Malaysia',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25,
                          ),
                          child: Column(
                            children: [
                              Text(
                                data.contents[0].beforeArrival[0],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                data.contents[0].beforeArrival[1],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Saat tiba di Malaysia',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Column(
                            children: [
                              Text(
                                data.contents[0].inArrival[0],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                data.contents[0].inArrival[1],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                data.contents[0].inArrival[2],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Saat berada di Malaysia',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          data.contents[0].afterArrival[0],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.contents[0].afterArrival[1],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                data.contents[0].afterArrival[2],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                data.contents[0].afterArrival[3],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                : (widget.country == 'Singapore')
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "SINGAPORE",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            Text(
                              'Sebelum berangkat ke Singapura',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              data.contents[1].beforeArrival[0],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.contents[1].beforeArrival[1],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].beforeArrival[2],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].beforeArrival[3],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].beforeArrival[4],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              data.contents[1].beforeArrival[5],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              data.contents[1].beforeArrival[6],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.contents[1].beforeArrival[7],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].beforeArrival[8],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].beforeArrival[9],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].beforeArrival[10],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].beforeArrival[11],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].beforeArrival[12],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              data.contents[1].beforeArrival[13],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              data.contents[1].beforeArrival[14],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Saat tiba di Singapura',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              data.contents[1].inArrival[0],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              data.contents[1].inArrival[1],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.contents[1].inArrival[2],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].inArrival[3],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].inArrival[4],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].inArrival[5],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].inArrival[6],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].inArrival[7],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              data.contents[1].inArrival[8],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              data.contents[1].inArrival[9],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              data.contents[1].inArrival[10],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              data.contents[1].inArrival[11],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Saat berada di Singapura',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              data.contents[1].afterArrival[0],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.contents[1].afterArrival[1],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].afterArrival[2],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].afterArrival[3],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].afterArrival[4],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    data.contents[1].afterArrival[5],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : (widget.country == 'Thailand')
                        ? Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "THAILAND",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 22,
                                ),
                                Text(
                                  'Sudah divaksinasi',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  data.contents[2].beforeArrival[0],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.contents[2].beforeArrival[1],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        data.contents[2].beforeArrival[2],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        data.contents[2].beforeArrival[3],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        data.contents[2].beforeArrival[4],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        data.contents[2].beforeArrival[5],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        data.contents[2].beforeArrival[6],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        data.contents[2].beforeArrival[7],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Belum divaksinasi',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  data.contents[2].afterArrival[0],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.contents[2].afterArrival[1],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        data.contents[2].afterArrival[2],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        data.contents[2].afterArrival[3],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        data.contents[2].afterArrival[4],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        data.contents[2].afterArrival[5],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        data.contents[2].afterArrival[6],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const Center()));
  }
}
