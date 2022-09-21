import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pkapp3/login_page.dart';
import 'package:pkapp3/sign_up_page.dart';

class buttons_with_texts extends StatelessWidget {
  const buttons_with_texts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => login_page())));
            },
            icon: Icon(Icons.restaurant_menu_sharp),
            label: Text(
              'Login',
              style: TextStyle(fontSize: 25),
            ),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Go with FoodyBite',
            style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,
              //decoration: TextDecoration.combine([TextDecoration.underline,TextDecoration.underline,]),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => sign_up_page())));
            },
            icon: Icon(Icons.edit),
            label: Text(
              'Register',
              style: TextStyle(fontSize: 25),
            ),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Be our Customer',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class chef_logo extends StatelessWidget {
  const chef_logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(50),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: CircleAvatar(
        radius: 90,
        backgroundImage: AssetImage('assets/images/chef_logo.jpg'),
      ),
    );
  }
}

class animated_text extends StatelessWidget {
  const animated_text({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 70),
      padding: const EdgeInsets.only(left: 20),
      child: DefaultTextStyle(
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          child: Row(
            children: [
              Text(
                'FoodyBite ',
                style: TextStyle(color: Color.fromARGB(255, 105, 54, 244)),
              ),
              AnimatedTextKit(animatedTexts: [
                TyperAnimatedText('delivers Best Experience...'),
                TyperAnimatedText('helps make memories...'),
                TyperAnimatedText('is at your doorsteps...:)'),
              ])
            ],
          )),
    );
  }
}
