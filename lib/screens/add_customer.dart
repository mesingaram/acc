import 'package:flutter/material.dart';
import '../home.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

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
            Container(
              padding: const EdgeInsets.only(left: 14.0, top: 14.0),
              child: Text(
                "Select Papers:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            CheckboxGroup(
              margin: const EdgeInsets.fromLTRB(120, 10, 20, 10),
              labels: <String>[
                'Dinamalar',
                'Dinakaran',
                'Hindu Tamil',
                'Dinamalar MDU',
                'The Hindu',
                'Business Line'
              ],
              onChange: (bool isChecked, String label, int index) =>
                  print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> checked) =>
                  print("checked: ${checked.toString()}"),
            ),
            //BASIC RADIOBUTTONGROUP
            Container(
              padding: const EdgeInsets.only(left: 14.0, top: 14.0),
              child: Text(
                "Basic RadioButtonGroup",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),

            RadioButtonGroup(
              labels: [
                "Option 1",
                "Option 2",
                "Option 3",
                "Option 4",
                "Option 5",
              ],
              onChange: (String label, int index) =>
                  print("label: $label index: $index"),
              onSelected: (String label) => print(label),
            ),
          ],
        ));
  }
}
