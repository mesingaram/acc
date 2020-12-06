import 'package:flutter/material.dart';

class AddCust extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _name;
  String _phoneNumber;
  bool dmrVal = false;
  bool dknVal = false;
  bool dmrmduVal = false;
  bool thVal = false;
  bool htVal = false;
  bool blVal = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  /// box widget
  /// [title] is the name of the checkbox
  /// [boolValue] is the boolean value of the checkbox
  Widget checkbox(String title, bool boolValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            /// manage the state of each value
            setState(() {
              switch (title) {
                case "Dinamalar":
                  dmrVal = value;
                  break;
                case "Dinakaran":
                  dknVal = value;
                  break;
                case "Dinamalar(MDU)":
                  dmrmduVal = value;
                  break;
                case "The Hindu":
                  thVal = value;
                  break;
                case "Hindu Tamil":
                  htVal = value;
                  break;
                case "Business Line":
                  blVal = value;
                  break;
              }
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dynamic Checkboxes"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildPhoneNumber(),
                checkbox("Dinamalar", dmrVal),
                checkbox("Dinakaran", dknVal),
                checkbox("Dinamalar(MDU)", dmrmduVal),
                checkbox("The Hindu", thVal),
                checkbox("Hindu Tamil", htVal),
                checkbox("Business Line", blVal),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    print(_name);
                    print(_phoneNumber);

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ));
  }
}
