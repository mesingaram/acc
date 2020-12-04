import 'package:acc/screens/add_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
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
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: OutlineButton.icon(
                shape: StadiumBorder(),
                onPressed: () {},
                icon: Icon(Icons.search),
                label: Text(
                  'View Customer Details',
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                //highlightedBorderColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: OutlineButton.icon(
                shape: StadiumBorder(),
                onPressed: () {},
                icon: Icon(Icons.search),
                label: Text(
                  'Button 2',
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                //highlightedBorderColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: OutlineButton.icon(
                shape: StadiumBorder(),
                onPressed: () {},
                icon: Icon(Icons.search),
                label: Text(
                  'Button 3',
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                //highlightedBorderColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: OutlineButton.icon(
                shape: StadiumBorder(),
                onPressed: () {},
                icon: Icon(Icons.search),
                label: Text(
                  'Button 4',
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                //highlightedBorderColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        //animatedIcon: AnimatedIcons.menu_close,
        child: Icon(Icons.people),
        curve: Curves.ease,
        children: [
          SpeedDialChild(
              child: Icon(Icons.delete),
              backgroundColor: Colors.red,
              label: "Delete customer",
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => AddCust()))),
          SpeedDialChild(
              child: Icon(Icons.add),
              backgroundColor: Colors.indigo,
              label: "Add new customer",
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => AddCust()))),
          SpeedDialChild(
              child: Icon(Icons.edit),
              backgroundColor: Colors.purple,
              label: "Modify customer",
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => AddCust())))
        ],
      ),
    );
  }
}
