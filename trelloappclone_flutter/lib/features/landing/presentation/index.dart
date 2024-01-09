import 'package:flutter/material.dart';
import 'package:trelloappclone_flutter/utils/config.dart';
import 'package:trelloappclone_flutter/utils/constant.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Image.asset(
            logo,
            width: 30,
            height: 30,
          ),
          Image.asset(
            landingImage,
            height: MediaQuery.sizeOf(context).height * 0.4,
          ),
          Text(
            headline,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
