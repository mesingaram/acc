import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'home.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  LocalAuthentication _auth = LocalAuthentication();
  // ignore: unused_field
  bool _checkBio = false;
  // ignore: unused_field
  bool _isBioFinger = false;

  @override
  void initState() {
    super.initState();
    _checkBiometrics();
    _listsBioAndFindFingerType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text("Flutter Biometric"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.fingerprint,
                size: 50,
              ),
              onPressed: _startAuth,
              iconSize: 60,
            ),
            SizedBox(height: 15),
            Text('Verify with fingerprint')
          ],
        ),
      ),
    );
  }

  void _checkBiometrics() async {
    try {
      final bio = await _auth.canCheckBiometrics;
      setState(() {
        _checkBio = bio;
      });
      //print('Biometrics = $_checkBio');
    } catch (e) {}
  }

  void _listsBioAndFindFingerType() async {
    List<BiometricType> _listType;
    try {
      _listType = await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e.message);
    }

    //print("List Biometrics = $_listType");

    if (_listType.contains(BiometricType.fingerprint)) {
      setState(() {
        _isBioFinger = true;
      });
      //print('Fingerprint is $_isBioFinger');
    }
  }

  void _startAuth() async {
    bool _isAuthenicated = false;
    try {
      _isAuthenicated = await _auth.authenticateWithBiometrics(
        localizedReason: "Scan your fingerprint",
        useErrorDialogs: true,
        stickyAuth: true,
        // androidAuthStrings: null,
        // iOSAuthStrings: null
      );
    } on PlatformException catch (e) {
      print(e.message);
    }

    if (_isAuthenicated) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => Home()));
    }
  }
}
