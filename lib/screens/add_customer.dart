import 'package:flutter/material.dart';
import '../home.dart';

class AddCust extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          )
        ],
        title: Text("Add new Customer"),
      ),
      body: Center(
        child: Text('Add customer page'),
      ),
    );
  }
}
