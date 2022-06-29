import 'package:flutter/material.dart';
import 'package:snack/snack.dart';
class Snackbar{
  static showSnack({required BuildContext context, required String message}){
    final bar = SnackBar(content: Text(message));
   bar.show(context);
  }
}