import 'package:flutter/material.dart';
import '../home.dart';

class EditCust extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        title: Text("Edit new Customer"),
      ),
      body: Center(
        child: Text('Edit customer page'),
      ),
    );
  }
}
