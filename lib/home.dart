import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Must import the upper two 'Future' and 'http' Libraries:
  // Using HTTP Request:

  Future getUserData() async {
    // If the link is not Secured then you can directly use => http.get('url')

    var response =
        await http.get(Uri.http('jsonplaceholder.typicode.com', 'users'));

    var jsonData = jsonDecode(response.body);

    List<User> users = [];

    for (var u in jsonData) {
      User data1 =
          User(name: u['name'], email: u['email'], userName: u['username']);

      users.add(data1);
    }

    // For checking Purpose:
    print('The Lenth Of Data is ${users.length}');
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),

/*      --------------------------------------
        To Check If Everything is Working:

        body: Center(
          child: ElevatedButton(
            child: Text('Click me'),
            onPressed: () {
              getUserData();
            },
          ),
        ), */

        body: Container(
          child: Card(
              child: FutureBuilder(
            future: getUserData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].name),
                      subtitle: Text(snapshot.data[index].userName),
                      trailing: Text(snapshot.data[index].email),
                    );
                  },
                );
              }
            },
          )),
        ),
      ),
    );
  }
}

class User {
  final String name, email, userName;

  User({required this.name, required this.email, required this.userName});
}
