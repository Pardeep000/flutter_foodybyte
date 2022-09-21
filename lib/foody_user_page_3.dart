import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pkapp3/foody_user_page.dart';
import 'package:pkapp3/foody_user_page_2.dart';
import 'package:pkapp3/global_variables.dart';
import 'package:pkapp3/menu_bar.dart';
import 'package:pkapp3/sign_up_page.dart';

import 'menu_data.dart';
//
import 'package:pkapp3/database2.dart';

class foody_user_items_page extends StatelessWidget {
  const foody_user_items_page(
      {Key? key, required this.uname, required this.umail})
      : super(key: key);
  final String uname, umail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: main_screen(),
      appBar: PreferredSize(
          child: nav_bar(),
          preferredSize: Size(MediaQuery.of(context).size.width, 100)),
      drawer: menu_bar(label1: uname, label2: umail),
    );
  }
}

class main_screen extends StatelessWidget {
  main_screen({Key? key}) : super(key: key);
  late bool decision_empty = global_var[0].display;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        background_image(),
        Column(
          children: [
            top_part(),
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                color: Color.fromARGB(255, 78, 64, 64).withOpacity(0.5),
                child: decision_empty ? front_items_in_cart() : empty_cart(),
              ),
            ),
            bottom_part(),
          ],
        ),
      ],
    );
  }
}

class top_part extends StatelessWidget {
  const top_part({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.17,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color.fromARGB(255, 78, 64, 64).withOpacity(0.5),
        ),
        child: Column(
          children: [
            Text(
              'Total items = ' + global_var[0].cart_no.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Total No. of Orders = 98',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                icon: Icon(Icons.thumb_up_alt_outlined),
                label: Text(
                  'Place an Order',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}

class bottom_part extends StatelessWidget {
  const bottom_part({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.12,
      padding: EdgeInsets.only(top: 20),
      //color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              icon: Icon(Icons.arrow_back),
              label: Text(
                'Go back',
                style: TextStyle(fontSize: 20),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.copyright, color: Colors.black),
              Text(
                'Karachi Pakistan, Inc. All rights reserved.',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}

//einstein@out
class front_items_in_cart extends StatefulWidget {
  const front_items_in_cart({Key? key}) : super(key: key);

  @override
  State<front_items_in_cart> createState() => _front_items_in_cartState();
}

class _front_items_in_cartState extends State<front_items_in_cart> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: global_var[0].cart_items.length,
        itemBuilder: (BuildContext context, int index) {
          return attached_item(
            datalist: global_var[0].cart_items[index],
          );
        });
  }
}

class empty_cart extends StatelessWidget {
  const empty_cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //color: Colors.amber,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          children: [
            Text(
              'Empty Cart',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(image: AssetImage('assets/images/empty_cart.jpg')),
            )
          ],
        ),
      ),
    );
  }
}

class attached_item extends StatefulWidget {
  attached_item({Key? key, required this.datalist}) : super(key: key);
  List datalist;

  @override
  State<attached_item> createState() => _attached_itemState();
}

class _attached_itemState extends State<attached_item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage:
                //AssetImage(global_var[0].cart_items[index][0]),
                AssetImage(widget.datalist[0]),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            //color: Colors.amber,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              children: [
                Text(
                  //'global_var[0].cart_items[index][1]',
                  widget.datalist[1],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                Divider(),
                Text(
                  //'global_var[0].cart_items[index][2]',
                  widget.datalist[2],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  int no = widget.datalist[3];
                  no--;
                  widget.datalist[3] = no;
                  foodybitedatabase().update(
                    widget.datalist[1],
                    widget.datalist[3],
                  );
                });
              },
              icon: Icon(Icons.remove)), // minus
          ///
          Text(widget.datalist[3].toString()),
          IconButton(
              onPressed: () {
                setState(() {
                  int no = widget.datalist[3];
                  no++;
                  widget.datalist[3] = no;
                  foodybitedatabase().update(
                    widget.datalist[1],
                    widget.datalist[3],
                  );
                });
              },
              icon: Icon(Icons.add)), //plus
          ///
          IconButton(
              onPressed: () {
                setState(() {
                  String name = widget.datalist[1];
                  // widget.datalist[0] = '';
                  // widget.datalist[1] = '';
                  // widget.datalist[2] = '';
                  // widget.datalist[3] = 0;
                  //
                  widget.datalist.clear();
                  
                  // do it by loop:\n
                  foodybitedatabase().delete2(name);
                });
              },
              icon: Icon(Icons.delete)), //delete
        ],
      ),
    );
  }
}
// data_addition() {
//   List data;
//   String mail, name, image, price;
//   for (var i = 0; i < global_var[0].cart_items.length; i++) {
//     data = global_var[0].cart_items[i];
//     //
//     mail = global_var[0].global_user_mail;
//     name = data[0];
//     image = data[1];
//     price = data[2];
//     //
//     foodybitedatabase().add(name, image, price, mail);
//   }
// }

