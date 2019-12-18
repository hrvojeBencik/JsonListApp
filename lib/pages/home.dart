import 'package:flutter/material.dart';
import 'package:json_list_app/models/user.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:json_list_app/pages/details.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({this.title});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //This is function that reads json file and transofrm information into users, and then returns it.
  Future<List<User>> _getUsers() async {
    var data = await http
        .get("https://next.json-generator.com/api/json/get/4yWjxGQAv?indent=2");
    var jsonData = json.decode(data.body);

    List<User> userList = [];

    for (var u in jsonData) {
      User user =
          User(u["index"], u["name"], u["email"], u["about"], u["picture"]);
      userList.add(user);
    }
    return userList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            SizedBox(
              width: 8,
            ),
            Icon(Icons.contacts, color: Colors.cyan[900]),
            SizedBox(
              width: 25,
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading...."),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        snapshot.data[index].picture,
                      ),
                    ),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].email),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(snapshot.data[index]),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
