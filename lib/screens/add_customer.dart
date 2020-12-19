import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../home.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class AddCust extends StatefulWidget {
  @override
  _AddCustState createState() => _AddCustState();
}

class _AddCustState extends State<AddCust> {
  final fb = FirebaseDatabase.instance;
  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
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
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ref = fb.reference();
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
                      controller: nameController,
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
                      controller: phoneController,
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
                  ClipOval(
                    child: Material(
                      color: Colors.blue, // button color
                      child: InkWell(
                        splashColor: Colors.red, // inkwell color
                        child: SizedBox(
                            width: 56, height: 56, child: Icon(Icons.check)),
                        onTap: () {
                          ref.child("name").set(nameController.text);
                          ref.child("phone no").set(phoneController.text);
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

class PaperCheckBox extends StatelessWidget {
  const PaperCheckBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxGroup(
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
    );
  }
}
