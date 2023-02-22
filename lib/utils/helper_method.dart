import 'package:flutter/material.dart';
import 'package:flutterweb/widgets/custom_text.dart';

class HelperMethod{

 static void showSnackBar(BuildContext context, String text){
    var snackBar = SnackBar(content: CustomText(text:text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}