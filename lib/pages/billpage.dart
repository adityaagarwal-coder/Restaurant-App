import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/homepage.dart';

class Bill extends StatefulWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Bill"),
        centerTitle: true,
        backgroundColor: Colors.red,
        leading: InkWell(
            onTap: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Icon(
              Icons.arrow_back,
            )),
      ),
      body: Center(
        child: Container(
          child: fetchData("items"),
        ),
      ),
    );
  }
}

Widget fetchData(String collectionName) {
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection(collectionName).snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text("Something is wrong"),
        );
      }

      return Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                    child: Text("Name",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))),
              ),
              SizedBox(width: 140),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                    child: Text("Price(in Rs)",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))),
              )
            ],
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      snapshot.data == null ? 0 : snapshot.data!.docs.length,
                  itemBuilder: (_, index) {
                    DocumentSnapshot _documentSnapshot =
                        snapshot.data!.docs[index];

                    return Card(
                      elevation: 5,
                      child: Row(children: [
                        Text(
                          _documentSnapshot['name'],
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(width: 250),
                        Text(
                          _documentSnapshot['price'].toString(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ]),
                    );
                  }),
            ),
          ),
          Row(
            children: [
              Container(
                child: Text("Total:",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                width: 230,
              ),
              Container(child: Builder(builder: (context) {
                num total = 0;
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  DocumentSnapshot _documentSnapshot = snapshot.data!.docs[i];
                  total += _documentSnapshot['price'];
                }
                return Container(
                    child:
                        Text(total.toString(), style: TextStyle(fontSize: 20)));
              })),
            ],
          )
        ],
      );
    },
  );
}
