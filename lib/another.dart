import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async' show Future;

class Another extends StatefulWidget {
  const Another({Key? key}) : super(key: key);

  @override
  State<Another> createState() => _AnotherState();
}

class _AnotherState extends State<Another> {
  var data = [];

  // Must import the upper Libraries:

  Future<String> loadJsonData2() async {
    var jsonText2 = await rootBundle.loadString('load_json/another.json');
    setState(() {
      data = json.decode(jsonText2);
    });
    return 'Success';
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parsing another JSON'),
      ),
      body: Container(
          child: Card(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            var name = data[index]['name'];
            var email = data[index]['email'];
            var dob = data[index]['dob'];
            var org = data[index]['org'];

            return Card(
              elevation: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Text(email),
                  Text(dob),
                  Text(org),
                ],
              ),
            );
          },
        ),
      )),
    );
  }
}
