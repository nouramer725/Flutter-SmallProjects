import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Birthday extends StatelessWidget {
  const Birthday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("D2BCD5"),
      body: const Center(
        child: Image(
          image: AssetImage("assets/images/jd86lo4d.png") ,
          alignment: AlignmentDirectional.center,
          fit: BoxFit.cover,

        ),
      ),
    );
  }
}
