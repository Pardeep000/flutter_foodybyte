import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:pkapp3/foody_user_page.dart';
import 'package:pkapp3/foody_user_page_2.dart';
import 'package:pkapp3/foody_user_page_3.dart';
import 'package:pkapp3/front_of_main_body.dart';
import 'package:pkapp3/login_page.dart';
import 'package:pkapp3/menu_bar.dart';
import 'package:pkapp3/sign_up_page.dart';
import 'package:pkapp3/slider_demo.dart';
import 'package:pkapp3/task_manager.dart';
//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'database.dart';
//
// void main() {
//   runApp(
//   MaterialApp(
//     title: 'Online Food Order App/site!!!',
//     theme: ThemeData.dark()
//         .copyWith(scaffoldBackgroundColor: Color.fromARGB(255, 56, 53, 53)),
//     home: homeapp(),
//     debugShowCheckedModeBanner: false,
//     //initialRoute: '/one',
//     // routes: {
//     //   '/one': (context) => login_page(),
//     //   '/two': (context) => sign_up_page(),
//     // },
//   ),
// );
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyBoYIY4V6Z_pngE1evQAKTuQc7Nue4JWNw",
    appId: "1:947254339969:web:54e012b6646ea33f0ce080",
    messagingSenderId: "947254339969",
    projectId: "flutter-with-firebase-83020",
  ));
  runApp(
    MaterialApp(
      title: 'Online Food Order App/site!!!',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: Color.fromARGB(255, 56, 53, 53)),
      home: homeapp(),
      debugShowCheckedModeBanner: false,
      //initialRoute: '/one',
      // routes: {
      //   '/one': (context) => login_page(),
      //   '/two': (context) => sign_up_page(),
      // },
    ),
  );
}

// class homeapp extends StatelessWidget {
//   const homeapp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: foody_user_items_page(
//         uname: 'default_elon-musk',
//         umail: 'default_mail@outlook.com',
//       ),
//     );
//   }
// }

class homeapp extends StatelessWidget {
  const homeapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: nav_bar(),
            preferredSize: Size(MediaQuery.of(context).size.width, 100)),
        body: main_body(),
        drawer: menu_bar(
          label1: 'Elon Musk',
          label2: 'elonmusk1727@outlook.com',
        ),
        floatingActionButton: floating_button());
  }
}

class nav_bar extends StatelessWidget {
  const nav_bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple, Colors.red, Colors.orange])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();

                //Navigator.push(context,MaterialPageRoute(builder: ((context) => MyHomePage())));
              },
              icon: Icon(Icons.menu)),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/logo.jpg'),
          ),
          Text(
            'Order with FoodyBite',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          )
        ],
      ),
    );
  }
}

class floating_button extends StatelessWidget {
  const floating_button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const slider_demo()),
          );
        },
        backgroundColor: Colors.black.withOpacity(0.5),
        icon: Icon(
          Icons.explore,
          color: Colors.white,
        ),
        label: Text(
          'Explore',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ));
  }
}

class main_body extends StatelessWidget {
  const main_body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image(
              image: AssetImage(
                'assets/images/f12.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                chef_logo(),
                animated_text(),
                buttons_with_texts(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
