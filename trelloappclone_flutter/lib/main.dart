import 'package:google_fonts/google_fonts.dart';
import 'package:trelloappclone_client/trelloappclone_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:trelloappclone_flutter/features/home/presentation/index.dart';
import 'package:trelloappclone_flutter/features/landing/presentation/index.dart';

import 'features/notification/presentation/index.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trello App Clone',
      theme: ThemeData(
        useMaterial3: false,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: GoogleFonts.poppins().fontFamily,
              bodyColor: Colors.black,
            ),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Landing(),
        '/home': (context) => Home(),
        '/notifications' : (context)=> Notifications(),
      },
    );
  }
}
