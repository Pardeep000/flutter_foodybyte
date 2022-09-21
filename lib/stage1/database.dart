import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FireStoreDataBase {
  List studentsList = [];
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("FoodyBite");

  Future getData() async {
    try {
      // to get data from a single/particular document alone.
      // var temp = await collectionRef.doc("Eop4Vq7nGXe4Rg4M0Sa4").get();

      //to get data from all documents sequentially
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          studentsList.add(result.data());
        }
      });

      // var temp = await collectionRef.doc("task_diary").get();
      // studentsList.add(temp.data());
      // return studentsList;

      return studentsList;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

// //
//   Future comparision(data1, data2) async {
//     try {
//       // to get data from a single/particular document alone.
//       // var temp = await collectionRef.doc("Eop4Vq7nGXe4Rg4M0Sa4").get();

//       //to get data from all documents sequentially
//       // await collectionRef.get().then((querySnapshot) {
//       //   for (var result in querySnapshot.docs) {
//       //     studentsList.add(result.data());
//       //   }
//       // });

//       var temp = await collectionRef.doc(data1).get();
//       print('got here');
//       studentsList.add(temp.data());
//       //print(studentsList[0].length);

//       return studentsList[0];
//     } catch (e) {
//       debugPrint("Error - $e");
//       return null;
//     }
//   }
//
  Future comparision(data1, data2) async {
    var temp = await collectionRef.doc(data1).get();
    print('got in comparision function');
    studentsList.add(temp.data());
    //print(studentsList[0].length);

    return studentsList[0];
  }

  Future<void> register(data1, data2, data3) {
    return collectionRef
        .doc(data2)
        //will edit the doc if already available or will create a new doc with this given ID
        .set(
          {
            'name': "$data1",
            'email': '$data2',
            'password': '$data3',
          },
          SetOptions(merge: true),
          // if set to 'false', then only these given fields will be added to that doc
        )
        .then((value) => debugPrint("User has been registered..."))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }

  // Future<void> add_Data(data1, data2) async {
  //   //await printDocID();
  //   //creates a new doc with unique doc ID
  //   return collectionRef
  //       .add({
  //         'title': "$data1",
  //         'desc': "$data2",
  //       })
  //       .then((value) => debugPrint("User Added"))
  //       .catchError((error) => debugPrint("Failed to add user: $error"));
  // }

  Future update(data1, data2) async {
    collectionRef
        .doc(data1)
        .update({'title': '$data1', 'desc': '$data2'})
        .then((value) => debugPrint("Data updated"))
        .catchError((error) => debugPrint("Failed to update data: $error"));
  }

  Future delete() async {
    collectionRef
        .doc('task')
        .update({'name': FieldValue.delete()})
        .then((value) => debugPrint("FieldValue deleted"))
        .catchError(
            (error) => debugPrint("Failed to delete fieldview: $error"));
  }

  Future delete2(data) async {
    collectionRef
        .doc(data)
        .delete()
        .then((value) => debugPrint("Document deleted"))
        .catchError((error) => debugPrint("Failed to delete document: $error"));
  }
//
}//class end terminal



