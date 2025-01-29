import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class BussinesCard extends StatelessWidget {
  const BussinesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("2B475E"),
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Business Card",
          style: TextStyle(color: Colors.white, fontSize: 30),
        )),
        backgroundColor: HexColor("2B475E"),
      ),
      body: Center(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 122,
              child: CircleAvatar(
                  radius: 121,
                  backgroundImage: AssetImage("assets/images/tharwat.png")),
            ),
            Text("Nour Muhammed",
                style: GoogleFonts.pacifico(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                )),
            Text("Flutter developer",
                style: GoogleFonts.lateef(
                  textStyle: Theme.of(context).textTheme.bodySmall,
                  fontSize: 25,
                  color: Colors.grey,
                )),
            const Divider(
              color: Color(0xFF6C8090),
              thickness: 3,
              indent: 60,
              endIndent: 60,
              height: 10,
            ),
            const Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 32,
                  color: Color(0xFF2B475E),
                ),
                title: Text(
                  '(+20) 123456789',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: Icon(
                  Icons.mail,
                  size: 32,
                  color: Color(0xFF2B475E),
                ),
                title: Text(
                  'nourmuh@gmail.com',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
