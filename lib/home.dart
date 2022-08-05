import 'package:flutter/material.dart';

import 'user_class.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User> users = getUsers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passing JSON data'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: ((context, index) {
            final user = users[index];

            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Name: ${user.name}',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                  ),
                  Text('Age : ${user.age}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                  Text('Gender : ${user.gender}',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.red))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  static List<User> getUsers() {
    const data = [
      {"name": "Huzaifa Khan", "age": "20", "gender": "male"},
      {"name": "Kamran Khan", "age": "22", "gender": "male"},
      {"name": "Dua Fatima", "age": "08", "gender": "female"},
      {"name": "Ayesha", "age": "07", "gender": "female"}
    ];

    return data.map<User>(User.fromJson).toList();
  }
}
