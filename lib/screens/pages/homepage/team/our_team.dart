// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../home_page.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
          backgroundColor: Colors.green[900],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/leaf.png')),
              SizedBox(
                height: 20,
              ),
              Text(
                'KrishiVue',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Blockchain based Insurance',
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    letterSpacing: 2.5,
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Card(
                color: Colors.grey[100],
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  title: Text(
                    'xxxxxxxxxxxxxxxx',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.grey[100],
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  title: Text(
                    'xxxxxxxxxx@gmail.com',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
