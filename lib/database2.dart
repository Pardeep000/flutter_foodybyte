import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class foodybitedatabase {
  List datastore = [];
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("FoodyBite_Item_Records");

  Future comparision(data1, data2) async {
    var temp = await collectionRef.doc(data1).get();
    print('got in comparision function');
    datastore.add(temp.data());
    //print(studentsList[0].length);

    return datastore[0];
  }

  Future<void> add(data1, data2, data3, data4, data5) {
    return collectionRef
        .doc(data1)
        //will edit the doc if already available or will create a new doc with this given ID
        .set(
          {
            'name': "$data1",
            'image': '$data2',
            'price': '$data3',
            'mail': '$data4',
            'no_of_items': data5, //integer
          },
          SetOptions(merge: true),
          // if set to 'false', then only these given fields will be added to that doc
        )
        .then((value) => debugPrint("Item info has been added..."))
        .catchError((error) => debugPrint("Failed to add item info: $error"));
  }

  Future update(data1,data2) async {
    collectionRef
        .doc(data1)
        .update({
          'no_of_items': data2,
        })
        .then((value) => debugPrint("no_of_items updated"))
        .catchError((error) => debugPrint("Failed to update data: $error"));
  }

  Future delete(data) async {
    collectionRef
        .doc(data)
        .update({'name': FieldValue.delete()})
        .then((value) => debugPrint("FieldValue deleted"))
        .catchError(
            (error) => debugPrint("Failed to delete fieldview: $error"));
  }

  Future delete2(data) async {
    collectionRef
        .doc(data)
        .delete()
        .then((value) => debugPrint("All data of items has been deleted..."))
        .catchError((error) => debugPrint("Failed to delete document: $error"));
  }
//
}//class end terminal



