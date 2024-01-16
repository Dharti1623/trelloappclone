import 'package:flutter/material.dart';
import 'package:trelloappclone_flutter/utils/color.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool active = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(backgroundColor: brandColor),
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text("Jane Doe"),
              ),
              const Text("@janedoe"),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("janedoe@gmail.com"),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            active = !active;
                          });
                        },
                        icon: Icon((active)
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up))
                  ],
                ),
              )
            ],
          )),
          (active)
              ? Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.pages,
                        color: brandColor,
                      ),
                      title: Text('Boards',
                          style: TextStyle(
                              color: brandColor, fontWeight: FontWeight.bold)),
                      onTap: () {},
                    ),
                    const Divider(height: 2, thickness: 2, color: brandColor),
                    ListTile(
                      leading: Icon(Icons.card_membership),
                      title: Text('My cards'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.pages),
                      title: Text('Offline boards'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.settings_sharp),
                      title: Text('Settings'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.help_outline_rounded),
                      title: Text('Help!'),
                      onTap: () {},
                    ),
                  ],
                )
              : ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Add account'),
                  onTap: () {},
                ),
        ],
      ),
    );
  }
}
