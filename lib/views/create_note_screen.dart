import 'package:flutter/material.dart';
import 'package:flutterweb/services/firestore_services.dart';
import 'package:flutterweb/widgets/custom_text.dart';
import 'package:flutterweb/widgets/custom_textformfield.dart';

import '../widgets/custom_button.dart';

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textEditController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(padding: EdgeInsets.all(size.width*0.02),
      child: Column(children: [

        CustomText(text: 'Create Notes',fontWeight: FontWeight.bold,fontSize: size.width*0.03),
        SizedBox(height: size.width*0.02),

        CustomTextFormField(
          controller: textEditController,
          hintText: 'Add some notes here',
          minLines: 10,
        ),
        SizedBox(height: size.width*0.02),
        CustomButton(text: 'Submit',onTap: (){
          var text = textEditController.text.trim();
          if(text.isEmpty){

          }else{
            FireStoreServices().createNote(context,text:text);
            textEditController.clear();
          }
        },),
      ],),),
    );
  }
}
