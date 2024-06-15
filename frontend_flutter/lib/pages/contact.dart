import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Us"),backgroundColor: Colors.purple[100],),
      body: Center(
        child: SizedBox(
          width: 500,
          child: ListView(
            children: const <Widget>[
              ListTile(
                leading: Icon(Icons.map),
                title: Text('Address'),
                trailing: Text("#3, Oak Street, Silver town-32", style: TextStyle(fontSize: 16),),
              ),
              ListTile(
                leading: Icon(Icons.mail),
                title: Text('Email'),
                trailing: Text("contact@hotel.co.in", style: TextStyle(fontSize: 20),),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone'),
                trailing: Text("99994444", style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
