import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterweb/models/notes_model.dart';
import 'package:flutterweb/services/firestore_services.dart';
import 'package:flutterweb/utils/colors.dart';
import 'package:flutterweb/utils/responsive.dart';
import 'package:flutterweb/views/gallery_view.dart';
import 'package:flutterweb/widgets/custom_text.dart';
import 'package:flutterweb/widgets/notes_container.dart';
import 'package:firebase_core/firebase_core.dart';
import '../utils/constants.dart';
import '../widgets/custom_mobile_screen.dart';
import 'create_note_screen.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile:  CustomMobileScreen(
            title: 'Notes', actions: [
              IconButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomMobileScreen(
                          title: 'Gallery', actions: [],
                          child: GalleryView())),
                );
              }, icon: const Icon(Icons.image))
        ],
            child: const Content(isFromMobile: true)),
        tablet: Row(
          children: const [
            Expanded(flex: 2, child: Content()),
            Expanded(flex: 1, child: CreateNoteScreen()),
          ],
        ),
        desktop: Row(
          children: [
            Expanded(flex: 1, child: Container(color: AppColors.greenColor)),
            const Expanded(flex: 2, child: Content()),
            const Expanded(flex: 1, child: CreateNoteScreen()),
          ],
        ),
      ),
      floatingActionButton: Responsive(
        mobile: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CustomMobileScreen(
                      title: 'Notes', actions: [],
                      child: CreateNoteScreen())),
            );
          },
          child: const Icon(Icons.add),
        ),
        tablet: const SizedBox.shrink(),
        desktop: const SizedBox.shrink(),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final bool isFromMobile;

  const Content({Key? key, this.isFromMobile = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(size.width * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (!isFromMobile) CustomText(
                  text: 'Notes',
                  fontSize: size.width * 0.035,
                  fontWeight: FontWeight.bold),
            // NotesContainer(size: size, text: Constants.dummyText),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('notes').orderBy("time", descending: true).snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.greenColor)
                  );
                }else {
                  var items = snapshot.data?.docs ?? [];
                  var list = <Notes>[];
                  if(items.isNotEmpty){
                    for (var e in items) {
                      var data = e.data() as Map;
                      var id = data['id'];
                      var text = data['text'];
                      var time = data['time'];
                      list.add(Notes.fromJson({'id':id,'text':text,'time':time}));
                    }

                  }
                  return  items.isEmpty ?
                   const Center(child: CustomText(text:'No Data Found'))
                      :
                   ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return NotesContainer(
                          size: size, note: list[index], onSave: (text) {
                      FireStoreServices().updateNote(context, text, list[index].id??'');
                      }, onDelete: () {
                        FireStoreServices().deleteNote(context,list[index].id??'');
                      },);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: size.width * 0.02);
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
