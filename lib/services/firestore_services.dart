import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterweb/utils/helper_method.dart';

import '../models/notes_model.dart';

class FireStoreServices{
  //Instantiate Firestore
  final db = FirebaseFirestore.instance;

    void createNote(BuildContext context,{String text = ''}) async {
      final docRef = db.collection('notes').doc();
      Notes appt = Notes(text: text, time: DateTime.now(), id: docRef.id);
       await docRef.set(appt.toJson()).then(
              (value) {
                log("Notes Added successfully!");
                HelperMethod.showSnackBar(context,'Notes Added successfully!');
              },
          onError: (e) {
            log("Error adding notes: $e");
            HelperMethod.showSnackBar(context,'Error adding notes: $e');
          });
  }

  void updateNote(BuildContext context,String text,String id) async {
    final docRef = db.collection('notes').doc(id);
    Notes appt = Notes(text: text, time: DateTime.now(), id: docRef.id);
    await docRef.set(appt.toJson()).then(
            (value) {
          log("Notes updated successfully!");
          HelperMethod.showSnackBar(context,'Notes updated successfully!');
        },
        onError: (e) {
          log("Error adding notes: $e");
          HelperMethod.showSnackBar(context,'Error updating notes: $e');
        });
  }

  void deleteNote(BuildContext context, String id) {
    final docRef = db.collection('notes').doc(id);
     docRef.delete().then(
            (value) {
          log("Notes updated successfully!");
          HelperMethod.showSnackBar(context,'Notes updated successfully!');
        },
        onError: (e) {
          log("Error adding notes: $e");
          HelperMethod.showSnackBar(context,'Error updating notes: $e');
        });
  }

  void addImagePathInDb(BuildContext context,String imagePath) async {
    final docRef = db.collection('images').doc();
    await docRef.set({'imageurl':imagePath}).then(
            (value) {
          log("image Added successfully!");
          HelperMethod.showSnackBar(context,'Notes Added successfully!');
        },
        onError: (e) {
          log("Error adding image: $e");
          HelperMethod.showSnackBar(context,'Error adding notes: $e');
        });
  }



// static void addImageToFirebase(){
 //
 //
 //    //CreateRefernce to path.
 //    StorageReference ref = storageReference.child("yourstorageLocation/");
 //
 //    //StorageUpload task is used to put the data you want in storage
 //    //Make sure to get the image first before calling this method otherwise _image will be null.
 //
 //    StorageUploadTask storageUploadTask = ref.child("image1.jpg").putFile(_image);
 //
 //    if (storageUploadTask.isSuccessful || storageUploadTask.isComplete) {
 //      final String url = await ref.getDownloadURL();
 //      print("The download URL is " + url);
 //    } else if (storageUploadTask.isInProgress) {
 //
 //      storageUploadTask.events.listen((event) {
 //        double percentage = 100 *(event.snapshot.bytesTransferred.toDouble()
 //            / event.snapshot.totalByteCount.toDouble());
 //        print("THe percentage " + percentage.toString());
 //      });
 //
 //      StorageTaskSnapshot storageTaskSnapshot =await storageUploadTask.onComplete;
 //      downloadUrl1 = await storageTaskSnapshot.ref.getDownloadURL();
 //
 //      //Here you can get the download URL when the task has been completed.
 //      print("Download URL " + downloadUrl1.toString());
 //
 //    } else{
 //      //Catch any cases here that might come up like canceled, interrupted
 //    }
 //
 //  }

}