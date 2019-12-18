import 'package:flutter/material.dart';
import '../models/user.dart';

class DetailsPage extends StatelessWidget {
  User user;
  DetailsPage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[700],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.cyan[900], //change your color here
        ),
        centerTitle: true,
        title: Text(user.name, style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 15,
            width: MediaQuery.of(context).size.width,
          ),
          CircleAvatar(
            radius: 75,
            backgroundImage: NetworkImage(user.picture),
          ),
          SizedBox(
            height: 15,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "About Me",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Text(
              user.about,
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 1,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
