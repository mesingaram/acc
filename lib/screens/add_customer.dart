import 'package:flutter/material.dart';
import '../home.dart';

class AddCust extends StatelessWidget {
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
          title: Text("Add new Customer"),
        ),
        body: new Column(
          children: <Widget>[
            new ListTile(
              leading: const Icon(Icons.person),
              title: new TextField(
                decoration: new InputDecoration(hintText: "Name"),
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.phone),
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: "Phone",
                ),
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            new ListTile(
              leading: const Icon(Icons.today),
              title: const Text('Birthday'),
              subtitle: const Text('February 20, 1980'),
              trailing: const Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ),
          ],
        ));
  }
}
