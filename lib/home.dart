import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async' show Future;

import 'user_class.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data = [];

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('load_json/person.json');
    setState(() {
      data = json.decode(jsonText);
    });

    return 'Sucess';
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  // List<User> users = getUsers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passing JSON data'),
      ),
      body: Container(
        // -------------------------------------------
        // Parsing JSON Data from Asset File.

        child: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: ((context, index) {
              var name = data[index]['name'];
              var email = data[index]['email'];
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(child: Text("HK")),
                    title: Text(name),
                    subtitle: Text(email),
                    trailing: Icon(
                      Icons.verified_outlined,
                      color: Colors.green,
                    ),
                  )
                ],
              );
            })),
      ),
    );
  }
}
