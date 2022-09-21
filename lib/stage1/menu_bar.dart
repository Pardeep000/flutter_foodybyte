import 'package:flutter/material.dart';
import 'package:pkapp3/main.dart';

class menu_bar extends StatelessWidget {
  const menu_bar({Key? key, required this.label1, required this.label2})
      : super(key: key);
  final String label1, label2;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 172, 161, 161),
          Color.fromARGB(255, 56, 52, 52),
          Color.fromARGB(255, 56, 52, 52),
          Color.fromARGB(255, 172, 161, 161)
        ])),
        child: Column(
          children: [
            top_of_menu(
              label1: label1,
              label2: label2,
            ),
            //
            follow_up_menu(
              label: 'Person',
              next: Icons.person,
            ),
            follow_up_menu(
              label: 'Cart',
              next: Icons.shopping_cart_outlined,
            ),
            follow_up_menu(
              label: 'Order',
              next: Icons.card_giftcard,
            ),
            follow_up_menu(
              label: 'About',
              next: Icons.error,
            ),
            //
            lower_part_menu(),
          ],
        ),
      ),
    );
  }
}

class top_of_menu extends StatelessWidget {
  const top_of_menu({Key? key, required this.label1, required this.label2})
      : super(key: key);
  final String label1, label2;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            //padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            color: Color.fromARGB(255, 83, 76, 76).withOpacity(0.5),
            child: Image.asset(
              'assets/images/bridge.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            color: Color.fromARGB(255, 83, 76, 76).withOpacity(0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/elon.jpg'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  label1,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  label2,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class follow_up_menu extends StatelessWidget {
  follow_up_menu({Key? key, required this.label, required this.next})
      : super(key: key);
  final IconData next;
  String label;

  //Function func;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color.fromARGB(255, 233, 96, 96).withOpacity(0.5),
          ),
          child: ListTile(
            leading: Icon(next),
            title: Text(
              label,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

class lower_part_menu extends StatelessWidget {
  const lower_part_menu({Key? key}) : super(key: key);

  void alert_msg(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Surity Demanded'),
      content: Text('Are you sure, you want to log out?'),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No')),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => homeapp())));
            },
            child: Text('Log Out'))
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.only(left: 40),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 83, 76, 76).withOpacity(0.5),
        ),
        child: Column(children: [
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Icon(
              Icons.change_circle,
              size: 40,
            ),
            title: Text(
              'Change',
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              print('got for msg');
              alert_msg(context);
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              child: ListTile(
                leading: Icon(Icons.backspace_sharp, size: 40),
                title: Text('Logout', style: TextStyle(fontSize: 25)),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
