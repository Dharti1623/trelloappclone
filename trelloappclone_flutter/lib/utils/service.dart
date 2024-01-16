import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:status_alert/status_alert.dart';
import 'package:trelloappclone_client/trelloappclone_client.dart';
import 'package:trelloappclone_flutter/features/home/presentation/custom_search.dart';
import 'package:trelloappclone_flutter/utils/color.dart';

import '../main.dart';

mixin Service {
  //Sign up new user

  signUp(BuildContext context) {
    if (context.mounted) {
      Navigator.pushNamed(context, '/home');
    }
  }

  //log in existing user
  login(BuildContext context) {
    if (context.mounted) {
      Navigator.pushNamed(context, '/home');
    }
  }

  //search for a board
  searchOption(BuildContext context) async {
    List<Board> allBoards = await client.board.getAllBoards();

    if (context.mounted) {
      showSearch(context: context, delegate: CustomSearchDelegate(allBoards));
    }
  }

//navigate to 'Create Workspace' menu
}
