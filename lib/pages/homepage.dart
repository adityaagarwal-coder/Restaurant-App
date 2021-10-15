import 'package:flutter/material.dart';
import 'package:restaurant_app/database.dart';
import 'package:restaurant_app/pages/billpage.dart';
import 'package:restaurant_app/utils/routes.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 0;
  DatabaseServices databaseServices = new DatabaseServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Restaurant App"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Center(
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          Text("Number of items in Cart:",
                              style: TextStyle(color: Colors.white)),
                          Text(
                            count.toString(),
                            style: TextStyle(color: Colors.white),
                          )
                        ]))),
                InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Bill()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("Generate Bill",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text("Dal"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Rs 100")
                          ],
                        ),
                        SizedBox(width: 150),
                        InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            Map<String, dynamic> taskMap = {
                              "name": "Dal",
                              "price": 100
                            };
                            databaseServices.createTask(taskMap);
                            setState(() {
                              count++;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(color: Colors.orange),
                            child: Text(
                              "ADD TO CART",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text("Roti"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Rs 30")
                          ],
                        ),
                        SizedBox(width: 150),
                        InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            Map<String, dynamic> taskMap = {
                              "name": "Roti",
                              "price": 30
                            };
                            databaseServices.createTask(taskMap);
                            setState(() {
                              count++;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(color: Colors.orange),
                            child: Text(
                              "ADD TO CART",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text("Aloo"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Rs 50")
                          ],
                        ),
                        SizedBox(width: 150),
                        InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            Map<String, dynamic> taskMap = {
                              "name": "Aloo",
                              "price": 50
                            };
                            databaseServices.createTask(taskMap);
                            setState(() {
                              count++;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(color: Colors.orange),
                            child: Text(
                              "ADD TO CART",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text("Mix Sabzi"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Rs 90")
                          ],
                        ),
                        SizedBox(width: 140),
                        InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            Map<String, dynamic> taskMap = {
                              "name": "Mix Sabzi",
                              "price": 90
                            };
                            databaseServices.createTask(taskMap);
                            setState(() {
                              count++;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(color: Colors.orange),
                            child: Text(
                              "ADD TO CART",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
