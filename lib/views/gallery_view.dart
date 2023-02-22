
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterweb/services/firestore_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../utils/colors.dart';
import '../widgets/custom_text.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({Key? key}) : super(key: key);

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  XFile? file ;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  StreamBuilder(
        stream: FirebaseFirestore.instance.collection('images').snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.greenColor)
            );
          }else {
            var items = snapshot.data?.docs ?? [];
            var list = <String>[];
            if(items.isNotEmpty){
              for (var e in items) {
                var url = e.get('imageurl');
                log("image url::: ${url}");
                list.add(url);
              }
            }
            return  items.isEmpty ?
            const Center(child: CustomText(text:'No Data Found'))
                :
            ListView.separated(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Image.network(list[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height:10);
              },
            );
          }
        },
      ),
      // body: Center(child: (file!=null && file?.path!=null) ? Image.file(File(file!.path)):Text('No item selected'),),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        upload(context);

      },child: Icon(Icons.add),),
    );
  }

  upload(BuildContext context) async {
    //pick image   use ImageSource.camera for accessing camera.
    file = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {

    });
    //basename() function will give you the filename
    String fileName = basename(file!.path);

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(fileName);
    UploadTask uploadTask = ref.putFile(File(file!.path));
    uploadTask.then((res) async{
      var imageUrl = await res.ref.getDownloadURL();
      print(imageUrl);
      FireStoreServices().addImagePathInDb(context, imageUrl);
      // res.ref.getDownloadURL();
    });
  }
}


