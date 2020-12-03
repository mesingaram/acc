import 'package:flutter/material.dart';
import '../auth.dart';

class AddCust extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Auth()));
            },
          )
        ],
      ),
      body: Center(
        child: Text('Add customer page'),
      ),
    );
  }
}
