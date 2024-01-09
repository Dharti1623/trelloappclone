import 'package:flutter/material.dart';
import 'package:trelloappclone_flutter/utils/color.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              logo,
              width: 30,
              height: 30,
            ),
          ),
          Image.asset(
            landingImage,
            height: MediaQuery.sizeOf(context).height * 0.4,
          ),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
              headline,textAlign: TextAlign.center,
              style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold,),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            width: MediaQuery.sizeOf(context).width * 0.8,
            height: 50,
            child: ElevatedButton(onPressed: () {}, child: const Text(signUp)),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            width: MediaQuery.sizeOf(context).width * 0.8,
            height: 50,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: brandColor)),
              child: const Text(login),
            ),
          ),
          const Text(terms, textAlign: TextAlign.center),
          const SizedBox(height: 10),
          const Text(contact,style: TextStyle(decoration: TextDecoration.underline),),
        ],
      )),
    );
  }
}
