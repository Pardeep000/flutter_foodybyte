import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//
import 'database.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  List dataList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FireStoreDataBase().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text(
              "Something went wrong",
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            dataList = snapshot.data as List;
            return screen(dataList: dataList);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class screen extends StatelessWidget {
  List dataList = [];
  screen({Key? key, required this.dataList}) : super(key: key);
  TextEditingController data1 = TextEditingController();
  TextEditingController data2 = TextEditingController();
  var data11;
  var data22;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 53, 52, 49),
      alignment: Alignment.center,
      child: Column(children: [
        //container for form
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text('Task Writer',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline)),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: data1,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.topic_outlined),
                    hintText: 'Topic',
                    labelText: 'Write your Topic',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: data2,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.add_task),
                    hintText: 'Task',
                    labelText: 'Type in your task',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  //FireStoreDataBase().register(data1.text, data2.text);
                  data11 = data1.text;
                  data22 = data2.text;
                  data1.text = '';
                  data2.text = '';
                },
                icon: Icon(Icons.send),
                label: Text('Add-Task'),
                style: ElevatedButton.styleFrom(minimumSize: Size(100, 30)),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        //Text('below it'),
        Expanded(
          child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: dataList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  //key: Key(index.toString()),
                  title: Text(
                    dataList[index]['title'] ?? "name not found",
                  ),
                  subtitle: Text(
                    dataList[index]['desc'] ?? "name not found",
                  ),
                  leading: IconButton(
                      onPressed: () {
                        FireStoreDataBase().update(dataList[index]['title'], data22);
                      },
                      icon: Icon(Icons.edit)),
                  trailing: IconButton(
                      onPressed: () {
                        FireStoreDataBase().delete2(dataList[index]['title']);
                        //
                      },
                      icon: Icon(Icons.delete_forever)),
                );
              }),
        ),
      ]),
    );
  }
}
