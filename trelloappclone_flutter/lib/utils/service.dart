import 'package:flutter/cupertino.dart';

mixin Service{
  signUp(BuildContext context){
    if(context.mounted){
      Navigator.pushNamed(context, '/home');
    }
  }

  login(BuildContext context){
    if(context.mounted){
      Navigator.pushNamed(context, '/home');
    }
  }


}