import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pkapp3/foody_user_page_2.dart';
import 'package:pkapp3/foody_user_page_3.dart';
import 'package:pkapp3/menu_bar.dart';
import 'package:pkapp3/sign_up_page.dart';

import 'menu_data.dart';
//
import 'package:pkapp3/global_variables.dart';

//
class foody_user_page extends StatelessWidget {
  foody_user_page({Key? key, required this.uname, required this.umail})
      : super(key: key);
  final String uname, umail;
//

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
      children: [background_image(), front_content()],
    );
  }
}

class background_image extends StatelessWidget {
  const background_image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image(
        image: AssetImage('assets/images/rest3.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }
}

class front_content extends StatefulWidget {
  front_content({Key? key}) : super(key: key);

  @override
  State<front_content> createState() => _front_contentState();
}

class _front_contentState extends State<front_content> {
  //
  List datalist = items;

  void func1() {
    setState(() {
      print('func1 is clicked');
      //item_name = 'all';
      datalist = items;
    });
  }

  void func2() {
    setState(() {
      print('func2 is clicked');
      //item_name = 'burger';
      datalist = items1;
    });
  }

  void func3() {
    setState(() {
      print('func3 is clicked');
      //item_name = 'dessert';
      datalist = items4;
    });
  }

  void func4() {
    setState(() {
      print('func4 is clicked');
      datalist = items3;
    });
  }

  void func5() {
    setState(() {
      print('func5 is clicked');
      datalist = items2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      //
      padding: EdgeInsets.all(10),
      color: Color.fromARGB(255, 247, 218, 132).withOpacity(0.5),
      //color: b1 ? Colors.black : Colors.amber,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            search_bar(),
            //
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  menu_items(
                    image: 'assets/images/menu_all.jpg',
                    label: 'All',
                    func: func1,
                  ),
                  menu_items(
                    image: 'assets/images/menu_burger.jpg',
                    label: 'Burger',
                    func: func2,
                  ),
                  menu_items(
                    image: 'assets/images/menu_desert.jpg',
                    label: 'Desserts',
                    func: func3,
                  ),
                  menu_items(
                    image: 'assets/images/menu_noodles.jpg',
                    label: 'Noodles',
                    func: func4,
                  ),
                  menu_items(
                    image: 'assets/images/menu_pizza.jpg',
                    label: 'Pizza',
                    func: func5,
                  ),
                  menu_items(
                    image: 'assets/images/menu_drinks.jpg',
                    label: 'Drinks',
                    func: func5,
                  ),
                  menu_items(
                    image: 'assets/images/menu_lasagna.jpg',
                    label: 'Lasagna',
                    func: func5,
                  ),
                  menu_items(
                    image: 'assets/images/menu_meatloaf.jpg',
                    label: 'MeatLoaf',
                    func: func5,
                  ),
                  menu_items(
                    image: 'assets/images/menu_rice.jpg',
                    label: 'Rice',
                    func: func5,
                  ),
                  menu_items(
                    image: 'assets/images/menu_rolls.jpg',
                    label: 'Mayonnaise rolls',
                    func: func5,
                  ),
                  menu_items(
                    image: 'assets/images/menu_salad.jpg',
                    label: 'Salad',
                    func: func5,
                  ),
                ],
              ),
            ),
            //
            exhibition_of_items_of_one_category(
              datalist_rec: datalist,
              //item_name: '',
            ),
            //
            bottom_part(),
          ],
        ),
      ),
    );
  }
}

class exhibition_of_items_of_one_category extends StatelessWidget {
  const exhibition_of_items_of_one_category(
      {Key? key, required this.datalist_rec})
      : super(key: key);
  //final String item_name;
  final List datalist_rec;
  //
  //final String decision = '';
  //

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.65,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemCount: datalist_rec.length,
        itemBuilder: (context, index) =>
            menu_item_extended(datalist: datalist_rec[index]));
  }
}

class menu_item_extended extends StatefulWidget {
  //const menu_item_extended({Key? key, required this.datalist})
  menu_item_extended({Key? key, required this.datalist}) : super(key: key);
  final all datalist;

  @override
  State<menu_item_extended> createState() => _menu_item_extendedState();
}

class _menu_item_extendedState extends State<menu_item_extended> {
  //
  late bool decision = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        String data1 = global_var[0].global_user_name;
        String data2 = global_var[0].global_user_mail;
        //setting up data so that next page can use it:\n
        global_var[0].global_image = widget.datalist.image;
        global_var[0].global_name = widget.datalist.name;
        global_var[0].global_desc = widget.datalist.desc;
        global_var[0].global_price = widget.datalist.price;
        //
        print('menu_item is clicked');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => foody_user_description_page(
                      uname: data1,
                      umail: data2,
                    ))));
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height *
            0.2, //controlled by childaspect ratio being in gridview.builder()
        //color: Colors.amber,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 58, 52, 52).withOpacity(0.5),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        //child: Image.asset(datalist.image),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            top_part_of_menu_item_extended(
                img: widget.datalist.image, price: widget.datalist.price),
            Container(
              //decoration: BoxDecoration(color:Colors.amber,),
              child: Text(
                widget.datalist.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Divider(
              color: Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      //
                      global_var[0].global_image = widget.datalist.image;
                      global_var[0].global_name = widget.datalist.name;
                      global_var[0].global_desc = widget.datalist.desc;
                      global_var[0].global_price = widget.datalist.price;
                      //
                      print('clicked for item-addition');
                      for (var i = 0;
                          i < global_var[0].cart_items.length;
                          i++) {
                        if (global_var[0].global_name ==
                            global_var[0].cart_items[i][1]) {
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
                        alert_msg(
                            context, 'Good to Go', 'Adding in the Cart...');
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
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Icon(Icons.shopping_cart, size: 25, color: Colors.black)
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class top_part_of_menu_item_extended extends StatelessWidget {
  const top_part_of_menu_item_extended(
      {Key? key, required this.img, required this.price})
      : super(key: key);
  final String img, price;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Image(
            image: AssetImage(img),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.red, //shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            "Rs.$price",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class menu_items extends StatelessWidget {
  const menu_items({
    Key? key,
    required this.image,
    required this.label,
    required this.func,

    //
  }) : super(key: key);
  final String image, label;

  //final String? Function(String?)? func;
  final Function func;
  //final Function() func;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        func();
      },
      //onTap: () {},
      //
      splashColor: Colors.purple,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.22,
        //height: MediaQuery.of(context).size.height * 0.5,
        //color: Colors.grey,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.18,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image(image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            // TextButton(
            //   onPressed: func(),
            //   child: Text(
            //     label,
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 20,
            //         color: Colors.black),
            //   ),
            // ),
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
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        //color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Description',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              //color: Colors.amber,
              child: Column(
                children: [
                  DefaultTextStyle(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                      child: AnimatedTextKit(animatedTexts: [
                        TyperAnimatedText(
                          'FoodyBite has variety of out of this world dishes, deserts, you name it...',
                        ),
                      ])),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultTextStyle(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                      child: AnimatedTextKit(animatedTexts: [
                        TyperAnimatedText(
                          'Clicking on the menu-icons would take us to the world of that specific item. Furthermore,clicking on the each item below takes to the desciption of that item.',
                        ),
                      ])),
                ],
              ),
            ),

            //copyright line
            Row(
              children: [
                Icon(Icons.copyright, color: Colors.black),
                Text(
                  'Karachi Pakistan, Inc. All rights reserved.',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ));
  }
}

class search_bar extends StatelessWidget {
  const search_bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        //contentPadding: EdgeInsets.symmetric(horizontal: 70),
        fillColor: Color.fromARGB(255, 90, 81, 81).withOpacity(0.5),
        filled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ),
        hintText: 'Search your Menu-item',
        labelText: 'Search',
        //
        hintStyle: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        labelStyle: TextStyle(
            fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),

        //
        border: new OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}

class nav_bar extends StatefulWidget {
  nav_bar({Key? key}) : super(key: key);

  @override
  State<nav_bar> createState() => _nav_barState();
}

class _nav_barState extends State<nav_bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple, Colors.red, Colors.orange])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu)),
          Text(
            'Foody-Menu',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          //IconButton(onPressed: () {}, icon: Icon(Icons.restaurant_menu)),
          ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  String data1 = global_var[0].global_user_name;
                  String data2 = global_var[0].global_user_mail;
                  //
                  global_var[0].cart_no = global_var[0].cart_items.length;
                  if (global_var[0].cart_items.length == 0) {
                    global_var[0].display = false;
                  } else {
                    global_var[0].display = true;
                  }
                  //
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => foody_user_items_page(
                                uname: data1,
                                umail: data2,
                              ))));
                });
              },
              icon: Icon(Icons.shopping_cart),
              label: Text(
                'shop',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),

          Text(''),
        ],
      ),
    );
  }
}
