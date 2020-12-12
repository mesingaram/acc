import 'package:acc/screens/add_customer.dart';
import 'package:acc/screens/delete_customer.dart';
import 'package:acc/screens/edit_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home", style: GoogleFonts.ubuntu()),
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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF73AEF5),
                        Color(0xFF61A4F1),
                        Color(0xFF478DE0),
                        Color(0xFF398AE5),
                      ],
                      stops: [0.1, 0.4, 0.7, 0.9],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildDetailBtn("Detail"),
                        _buildDetailBtn("Line"),
                        _buildDetailBtn("Bill")
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.white,
        //animatedIcon: AnimatedIcons.menu_close,
        child: Icon(
          Icons.people,
          color: Colors.blue,
        ),
        curve: Curves.ease,
        children: [
          SpeedDialChild(
              child: Icon(Icons.remove_circle_outline),
              backgroundColor: Colors.red,
              label: "Delete customer",
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DeleteCust()))),
          SpeedDialChild(
              child: Icon(Icons.person_add),
              backgroundColor: Colors.indigo,
              label: "Add new customer",
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => AddCust()))),
          SpeedDialChild(
              child: Icon(Icons.edit),
              backgroundColor: Colors.purple,
              label: "Modify customer",
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => EditCust())))
        ],
      ),
    );
  }
}

Widget _buildDetailBtn(String text) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 80.0,
      width: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Container(
        child: Column(children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
          ),
          Text(
            "$text",
            style: GoogleFonts.ubuntu(
                color: Colors.blue, fontSize: 10, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    ),
  );
}
