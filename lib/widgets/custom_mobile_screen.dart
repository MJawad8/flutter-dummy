import 'package:flutter/material.dart';
import 'package:flutterweb/utils/colors.dart';
import 'package:flutterweb/widgets/custom_text.dart';

class CustomMobileScreen extends StatelessWidget {
  final Widget child;
  final String title;
  final List<Widget> actions;

  const CustomMobileScreen(
      {Key? key,
      required this.child,
      required this.title,
      required this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        centerTitle: true,
        title: CustomText(
          text: title,
          color: AppColors.whiteColor,
        ),
        actions: actions,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
