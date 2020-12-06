import 'package:flutter/material.dart';
import '../home.dart';

class DeleteCust extends StatelessWidget {
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
        title: Text("Delete new Customer"),
      ),
      body: Center(
        child: Text('Delete customer page'),
      ),
    );
  }
}
