import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterweb/models/notes_model.dart';
import 'package:flutterweb/utils/colors.dart';
import 'package:flutterweb/widgets/custom_text.dart';
import 'package:flutterweb/widgets/custom_textformfield.dart';

class NotesContainer extends StatefulWidget {
  final Size size;
  final Notes note;
  final Function(String) onSave;
  final VoidCallback onDelete;

  const NotesContainer(
      {Key? key,
      required this.size,
      required this.note,
      required this.onSave,
      required this.onDelete})
      : super(key: key);

  @override
  State<NotesContainer> createState() => _NotesContainerState();
}

class _NotesContainerState extends State<NotesContainer> {
  bool isEditEnable = false;
  var textEditController = TextEditingController();

  @override
  void initState() {
    textEditController.text = widget.note.text??'';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyColor,width: 0.5),
          borderRadius: BorderRadius.circular(10), color: AppColors.whiteColor),
      padding: EdgeInsets.all(widget.size.width * 0.02),
      child: isEditEnable
          ? Column(
              children: [
                // Align(alignment: Alignment.topRight,child: TextButton(child: const CustomText(text:'Edit'),onPressed: (){},),),
                CustomTextFormField(
                    controller: textEditController, minLines: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          log('clickedddd..... save');
                          setState(() {
                            isEditEnable = false;
                          });
                          widget.onSave(textEditController.text.trim());
                        },
                        child: const CustomText(text: 'Save')),
                    SizedBox(width: widget.size.width * 0.02),
                    TextButton(
                        onPressed: () {
                          log('clickedddd..... cancle');
                          setState(() {
                            isEditEnable = false;
                          });
                        },
                        child: const CustomText(text: 'Cancel')),
                  ],
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const CustomText(text: 'Edit'),
                      onPressed: () {
                        setState(() {
                          isEditEnable = true;
                        });
                      },
                    ),
                    TextButton(
                      child: const CustomText(text: 'Delete'),
                      onPressed: () async {
                        var result = await showAlertDialog(context);
                        if (result == true) {
                          widget.onDelete();
                        }
                      },
                    ),
                  ],
                ),
                CustomText(
                  text: widget.note.text??'',
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
    );
  }

  Future<bool> showAlertDialog(BuildContext context) async {
    // show the dialog
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const CustomText(text: "Alert!"),
          content: const CustomText(
              text: "Are you sure you want to delete this note?"),
          actions: [
            TextButton(
              child: const CustomText(text: "Cancel"),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              child: const CustomText(text: "OK"),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }
}
