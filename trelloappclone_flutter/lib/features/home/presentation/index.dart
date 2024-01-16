import 'package:flutter/material.dart';
import 'package:trelloappclone_flutter/utils/color.dart';
import 'package:trelloappclone_flutter/utils/service.dart';
import 'package:trelloappclone_flutter/utils/widgets.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../../../utils/config.dart';
import '../../drawer/presentation/index.dart';
import 'custom_floating_action.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with Service {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Boards"),

        actions: [
          IconButton(
              onPressed: () {
                searchOption(context);
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                //Navigate to Notification screen
              },
              icon: Icon(Icons.notifications_none_outlined)),
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              tileColor: whiteShade,
              leading: Text("Workspace 1"),
              trailing: IconButton(
                  onPressed: () {
                    //Navigate to Workspace menu screen
                  },
                  icon: Icon(Icons.more_horiz)),
            ),
            ListTile(
              title: Text('Board 1'),
              leading: ColorSquare(
                bg: backgrounds[0],
              ),
              onTap: () {},
            )
          ],
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
          type: ExpandableFabType.up,
          backgroundColor: Colors.green[400],
          expandedFabSize: ExpandableFabSize.regular,
          child: const Icon(Icons.add),
          children: const [
            CustomFloatingAction("Workspace", Icons.book, '/createWorkspace'),
            CustomFloatingAction("Board", Icons.book, '/createBoard'),
            CustomFloatingAction("Card", Icons.card_membership, '/createCard'),
          ]),
    );
  }
}
