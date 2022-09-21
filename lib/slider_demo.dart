import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class slider_demo extends StatelessWidget {
  const slider_demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: 0.62,
          shrinkWrap: true,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          children: [
            Carousel(
              boxFit: BoxFit.fill,
              //
              autoplay: true,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 700),
              //
              dotColor: Colors.red,
              dotBgColor: Colors.black.withOpacity(0.5),
              dotSize: 10,
              //

              images: [
                fast_image(
                    img: 'assets/images/zinger2.jpg',
                    label:
                        'Juicy Chicken, Special Mushrrom with Fried Onion Ring',
                    price: 'Rs.399'),
                fast_image(
                    img: 'assets/images/pizza1.jpg',
                    label:
                        'Topped with Afghani meat, special Arabian pickles of carrot and cucumber, & melting cheese, made with a base of creaminess. ',
                    price: 'Rs.1099'),
                fast_image(
                    img: 'assets/images/roll1.jpg',
                    label:
                        'Grilled Chicken Topped with Mayonnaise and spicy Sauce and Jalepeno and Classic Cheese',
                    price: 'Rs.449'),
                fast_image(
                    img: 'assets/images/zinger1.jpg',
                    label:
                        'Marinated Fajita Chicken, Capsicum, Onion, and Tomatto, Fajita Sauce',
                    price: 'Rs.599'),
                fast_image(
                    img: 'assets/images/f4.jpg',
                    label:
                        'Creamy Pizza topped bottomed with Mayonnaise and Fjaita Chicken and Capsicum ',
                    price: 'Rs.649'),
                fast_image(
                    img: 'assets/images/f5.jpg',
                    label: 'Tasty Rice with Roasted Chicken and Afghani meat',
                    price: 'Rs.1019'),
                fast_image(
                    img: 'assets/images/f12.jpg',
                    label:
                        'Chief Special Nachos, Topping with Cheese Slice, Iceberg, Jalapeno, Salsa and Sour Cream',
                    price: 'Rs.809'),
                fast_image(
                    img: 'assets/images/f17.jpg',
                    label:
                        'Chief Special Nachos, Topping with Cheese Slice, Iceberg, Jalapeno, Salsa and Sour Cream',
                    price: 'Rs.809'),
                fast_image(
                    img: 'assets/images/samosa1.jpg',
                    label: 'Super Crispy Fried Chicken Wontons, Dip Sauce',
                    price: 'Rs.209'),
              ],
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.orange, Colors.pink])),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [
                  Text(
                    'FoodyBite Provides Best Living Bite Experience',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/logo.jpg'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Go To Main-Menu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        //primary: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class fast_image extends StatelessWidget {
  const fast_image({
    Key? key,
    required this.img,
    required this.label,
    required this.price,
  }) : super(key: key);
  final String img, label, price;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            img,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 25),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {},
                  child: Text(
                    price,
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
