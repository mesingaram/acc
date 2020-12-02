import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'background_painter.dart';
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
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            CustomPaint(painter: BackgroundPainter()),
            buildSignUp(),
          ],
        ),
      );

  Widget buildSignUp() => Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 175,
              child: Text(
                'Welcome to My App',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Spacer(),
          IconButton(
              icon: Icon(Icons.fingerprint, size: 70),
              onPressed: _startAuth,
              iconSize: 70),
          SizedBox(height: 12),
          Text(
            'Login to continue',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
        ],
      );

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
