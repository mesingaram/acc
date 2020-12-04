import 'package:acc/screens/add_customer.dart';
import 'package:flutter/material.dart';
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AddCust()));
        },
      ),
    );
  }
}
