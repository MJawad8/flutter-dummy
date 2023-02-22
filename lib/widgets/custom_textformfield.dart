import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.inputType,
    this.controller,
    this.textInputAction,
    this.inputFormatter,
    this.leadingIcon,
    this.minLines,
    this.maxLines,
  }) : super(key: key);
  final String? hintText;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? leadingIcon;
  final int? minLines;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    var textFieldOutline = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      // borderSide: const BorderSide(color: AppColors.primaryGreenColor),
    );
    return TextField(
      controller: controller,
      keyboardType: inputType,
      minLines: minLines,
      //Normal textInputField will be displayed
      maxLines: maxLines,
      // when user presses enter it will adapt to it
      decoration: InputDecoration(
          enabledBorder: textFieldOutline,
          focusedBorder: textFieldOutline,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          prefixIcon: leadingIcon,
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: hintText,
          fillColor: Colors.white70),
    );
  }
}
