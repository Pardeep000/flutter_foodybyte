// import 'dart:html';

// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:pkapp3/foody_user_page.dart';
// import 'package:pkapp3/foody_user_page_3.dart';
// import 'package:pkapp3/global_variables.dart';
// import 'package:pkapp3/menu_bar.dart';
// import 'package:pkapp3/sign_up_page.dart';

// import 'menu_data.dart';

// class foody_user_description_page extends StatelessWidget {
//   const foody_user_description_page(
//       {Key? key, required this.uname, required this.umail})
//       : super(key: key);
//   final String uname, umail;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: main_screen(),
//       appBar: PreferredSize(
//           child: nav_bar(),
//           preferredSize: Size(MediaQuery.of(context).size.width, 100)),
//       drawer: menu_bar(label1: uname, label2: umail),
//     );
//   }
// }

// class main_screen extends StatelessWidget {
//   const main_screen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [background_image(), front_content_desciption_page()],
//     );
//   }
// }

// class front_content_desciption_page extends StatelessWidget {
//   const front_content_desciption_page({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(bottom: 0),
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 20,
//               right: 20,
//               top: 20,
//             ),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 color: Color.fromARGB(255, 90, 87, 78).withOpacity(0.5),
//               ),
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * 0.80, //original
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   //
//                   Column(
//                     children: [
//                       name_price(
//                           label: 'Tandoori chicken ',
//                           //label: 'Tandoori chicken pizza with chicken topping',
//                           //label: global_var[0].global_name,
//                           decision1: true,
//                           decision2: false),
//                       image(),
//                       name_price(
//                           //label: 'Rs.349 Only',
//                           label: 'Rs.' + global_var[0].global_price + ' Only',
//                           decision1: false,
//                           decision2: true),
//                     ],
//                   ),
//                   ////
//                   desc(),
//                   add_to_cart(),
//                 ],
//               ),
//             ),
//           ),
//           //back_button
//           ElevatedButton.icon(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             icon: Icon(Icons.arrow_back),
//             label: Text(
//               'Back-to-Menu',
//               style: TextStyle(fontSize: 20),
//             ),
//             style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50))),
//           ),
//           //copyright line
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.copyright, color: Colors.black),
//               Text(
//                 'Karachi Pakistan, Inc. All rights reserved.',
//                 style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class add_to_cart extends StatefulWidget {
//   const add_to_cart({Key? key}) : super(key: key);

//   @override
//   State<add_to_cart> createState() => _add_to_cartState();
// }

// class _add_to_cartState extends State<add_to_cart> {
//   late bool decision = true;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height * 0.06,
//       decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(50),
//             bottomRight: Radius.circular(50),
//           )),
//       child: TextButton(
//         onPressed: () {
//           setState(() {
//             print('got in cart-button');
//             for (var i = 0; i < global_var[0].cart_items.length; i++) {
//               if (global_var[0].global_name == global_var[0].cart_items[i][1]) {
//                 print('found');
//                 decision = false;
//                 break;
//               }
//               //else {
//               //   print('nothing found');
//               //   decision = true;
//               // }
//             }
//             if (decision == true) {
//               alert_msg(context, 'Good to Go', 'Adding in the Cart...');
//               //
//               global_var[0].cart_items.add([
//                 global_var[0].global_image,
//                 global_var[0].global_name,
//                 global_var[0].global_price
//               ]);
//             } else {
//               alert_msg(context, 'Cart Message',
//                   'Item has already been added in the cart.');
//             }
//             //global_var[0].cart_no = ++i;

//             ///
//             String data1 = global_var[0].global_user_name;
//             String data2 = global_var[0].global_user_mail;
//             print('menu_item is clicked');
//             // Navigator.push(
//             //     context,
//             //     MaterialPageRoute(
//             //         builder: ((context) => foody_user_items_page(
//             //               uname: data1,
//             //               umail: data2,
//             //             ))));
//             //print(global_var[0].cart_items[0][0]);
//             ///
//           });
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.shopping_cart,
//               size: 20,
//               color: Colors.white,
//             ),
//             SizedBox(
//               width: 5,
//             ),
//             Text(
//               'Add to Cart',
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class desc extends StatelessWidget {
//   const desc({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(
//         left: 20,
//         right: 20,
//         top: 20,
//       ),
//       //margin: EdgeInsets.only(bottom: 14),//original
//       //margin: EdgeInsets.only(bottom: 0),
//       //color: Colors.amber,
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height * 0.3,
//       child: Text(
//         global_var[0].global_desc,
//         textAlign: TextAlign.center,
//         style: TextStyle(fontSize: 22, color: Colors.red),
//       ),
//     );
//   }
// }

// class image extends StatelessWidget {
//   const image({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height * 0.3,
//       color: Colors.amber,
//       child: Image(
//           image: AssetImage('assets/images/zinger2.jpg'), fit: BoxFit.cover),
//       //image: AssetImage(global_var[0].global_image),fit: BoxFit.cover),
//     );
//   }
// }

// class name_price extends StatelessWidget {
//   const name_price({
//     Key? key,
//     required this.label,
//     required this.decision1,
//     required this.decision2,
//   }) : super(key: key);
//   final String label;
//   final bool decision1;
//   final bool decision2;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //padding: EdgeInsets.only(left: 20, right: 20, top: 4), //original
//       padding: EdgeInsets.only(left: 20, right: 20, top: 2),
//       width: MediaQuery.of(context).size.width,
//       //height: MediaQuery.of(context).size.height*0.06,//original
//       constraints: BoxConstraints(
//         maxHeight: MediaQuery.of(context).size.height * 0.10,
//       ),
//       decoration: BoxDecoration(
//           //color: decision ? Colors.white : Colors.black,
//           color: Colors.blue,
//           borderRadius: BorderRadius.only(
//             topLeft: decision1 ? Radius.circular(50) : Radius.circular(0),
//             topRight: decision1 ? Radius.circular(50) : Radius.circular(0),
//             bottomLeft: decision2 ? Radius.circular(50) : Radius.circular(0),
//             bottomRight: decision2 ? Radius.circular(50) : Radius.circular(0),
//           )),
//       child: Text(
//         label,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//             fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
//       ),
//     );
//   }
// }

// alert_msg(BuildContext context, String label1, String label2) {
//   AlertDialog alert = AlertDialog(
//     title: Text(label1),
//     content: Text(label2),
//     actions: [
//       ElevatedButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: Text('OK')),
//     ],
//   );
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       });
// }
/////////////////////////////////////////
import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pkapp3/foody_user_page.dart';
import 'package:pkapp3/foody_user_page_3.dart';
import 'package:pkapp3/global_variables.dart';
import 'package:pkapp3/menu_bar.dart';
import 'package:pkapp3/sign_up_page.dart';

import 'menu_data.dart';

class foody_user_description_page extends StatelessWidget {
  const foody_user_description_page(
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
  const main_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [background_image(), front_content_desciption_page()],
    );
  }
}

class front_content_desciption_page extends StatelessWidget {
  const front_content_desciption_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(255, 90, 87, 78).withOpacity(0.5),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //
                  Column(
                    children: [
                      name_price(
                          //label: 'Tandoori chicken pizza',
                          label: global_var[0].global_name,
                          decision1: true,
                          decision2: false),
                      image(),
                      name_price(
                          //label: 'Rs.349 Only',
                          label: 'Rs.' + global_var[0].global_price + ' Only',
                          decision1: false,
                          decision2: true),
                    ],
                  ),
                  //
                  desc(),
                  add_to_cart(),
                ],
              ),
            ),
          ),
          //back_button
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
            label: Text(
              'Back-to-Menu',
              style: TextStyle(fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
          ),
          //copyright line
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

class add_to_cart extends StatefulWidget {
  const add_to_cart({Key? key}) : super(key: key);

  @override
  State<add_to_cart> createState() => _add_to_cartState();
}

class _add_to_cartState extends State<add_to_cart> {
  late bool decision = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
      child: TextButton(
        onPressed: () {
          setState(() {
            print('got in cart-button');
            for (var i = 0; i < global_var[0].cart_items.length; i++) {
              if (global_var[0].global_name == global_var[0].cart_items[i][1]) {
                print('found');
                decision = false;
                break;
              }
              //else {
              //   print('nothing found');
              //   decision = true;
              // }
            }
            if (decision == true) {
              alert_msg(context, 'Good to Go', 'Adding in the Cart...');
              //
              global_var[0].cart_items.add([
                global_var[0].global_image,
                global_var[0].global_name,
                global_var[0].global_price
              ]);
            } else {
              alert_msg(context, 'Cart Message',
                  'Item has already been added in the cart.');
            }
            //global_var[0].cart_no = ++i;

            ///
            String data1 = global_var[0].global_user_name;
            String data2 = global_var[0].global_user_mail;
            print('menu_item is clicked');
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: ((context) => foody_user_items_page(
            //               uname: data1,
            //               umail: data2,
            //             ))));
            //print(global_var[0].cart_items[0][0]);
            ///
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 20,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Add to Cart',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class desc extends StatelessWidget {
  const desc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      //margin: EdgeInsets.only(bottom: 14),
      //color: Colors.amber,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Text(
        global_var[0].global_desc,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22, color: Colors.red),
      ),
    );
  }
}

class image extends StatelessWidget {
  const image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      color: Colors.amber,
      child: Image(
          //image: AssetImage('assets/images/zinger2.jpg'), fit: BoxFit.cover),
          image: AssetImage(global_var[0].global_image),
          fit: BoxFit.cover),
    );
  }
}

class name_price extends StatelessWidget {
  const name_price({
    Key? key,
    required this.label,
    required this.decision1,
    required this.decision2,
  }) : super(key: key);
  final String label;
  final bool decision1;
  final bool decision2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 2),
      width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height*0.06,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.10,
      ),
      decoration: BoxDecoration(
          //color: decision ? Colors.white : Colors.black,
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: decision1 ? Radius.circular(50) : Radius.circular(0),
            topRight: decision1 ? Radius.circular(50) : Radius.circular(0),
            bottomLeft: decision2 ? Radius.circular(50) : Radius.circular(0),
            bottomRight: decision2 ? Radius.circular(50) : Radius.circular(0),
          )),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

alert_msg(BuildContext context, String label1, String label2) {
  AlertDialog alert = AlertDialog(
    title: Text(label1),
    content: Text(label2),
    actions: [
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK')),
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
