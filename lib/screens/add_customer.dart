import 'package:flutter/material.dart';
import '../home.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class AddCust extends StatefulWidget {
  @override
  _AddCustState createState() => _AddCustState();
}

class _AddCustState extends State<AddCust> {
  final _formkey = GlobalKey<FormState>();
  String _myActivity;
  String _myActivityResult;

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = _formkey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

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
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Container(
              child: new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.person),
                    title: new TextFormField(
                      decoration: new InputDecoration(hintText: "Name"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please Enter Your Name";
                        }
                        return null;
                      },
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.phone),
                    title: new TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        hintText: "Phone",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please Enter Your Phone";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: DropDownFormField(
                      titleText: 'Line',
                      hintText: 'Select Line',
                      value: _myActivity,
                      onSaved: (value) {
                        setState(() {
                          _myActivity = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          _myActivity = value;
                        });
                      },
                      dataSource: [
                        {
                          "display": "Bus Stand",
                          "value": "Bus Stand",
                        },
                        {
                          "display": "Housing Board",
                          "value": "Housing Board",
                        },
                        {
                          "display": "Pudupatti",
                          "value": "Pudupatti",
                        },
                        {
                          "display": "Santhai",
                          "value": "Santhai",
                        },
                        {
                          "display": "Valayapatti",
                          "value": "Valayapatti",
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 14.0, top: 14.0),
                    child: Text(
                      "Select Papers:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
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
                    onChange: (bool isChecked, String label, int index) => print(
                        "isChecked: $isChecked   label: $label  index: $index"),
                    onSelected: (List<String> checked) =>
                        print("checked: ${checked.toString()}"),
                  ),
                  ClipOval(
                    child: Material(
                      color: Colors.blue, // button color
                      child: InkWell(
                        splashColor: Colors.red, // inkwell color
                        child: SizedBox(
                            width: 56, height: 56, child: Icon(Icons.check)),
                        onTap: () {
                          _saveForm();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
