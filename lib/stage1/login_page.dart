import 'package:flutter/material.dart';
import 'package:pkapp3/database.dart';
import 'package:pkapp3/foody_user_page.dart';
import 'package:pkapp3/global_variables.dart';
import 'package:pkapp3/main.dart';

class login_page extends StatelessWidget {
  login_page({Key? key}) : super(key: key);

  //GlobalKey<ScaffoldState> globalkey = GlobalKey<ScaffoldState>();
  //final GlobalKey<ScaffoldMessengerState> globalkey =GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: globalkey,
      body: login_body(),
    );
  }
}

class login_body extends StatelessWidget {
  const login_body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.pink, Colors.orange, Colors.red])),
      child: Column(
        children: [
          top_part(),
          middle_part(),
          bottom_part(),
          bottom_nav_bar(),
        ],
      ),
    );
  }
}

class bottom_part extends StatefulWidget {
  bottom_part({Key? key}) : super(key: key);

  @override
  State<bottom_part> createState() => _bottom_partState();
}

class _bottom_partState extends State<bottom_part> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  bool key1 = false;
  bool key2 = false;
  //
  void validate() async {
    if (formkey.currentState!.validate()) {
      print('Login validation...');
      //
      if (key1 == true && key2 == true) {
        key1 = false;
        key2 = false;
        var data =
            await FireStoreDataBase().comparision(email.text, password.text);
        if (data == null) {
          String label1 = 'Email Verification Error';
          String label2 = 'Email-Address does not match';
          alert_msg(context, label1, label2, '', '', false);
          print('nothing found');
        } else {
          if (data['password'] != password.text) {
            String label1 = 'Password Error';
            String label2 = 'Password does not match';
            alert_msg(context, label1, label2, '', '', false);
            print('password does not match...');
          } else {
            String label1 = 'Verification Ensured';
            String label2 = 'We are good to go...Welcome!!!';
            String uname = data['name'];
            String umail = data['email'];
            alert_msg(context, label1, label2, uname, umail, true);
            print('Everything matched...');
            email.text = '';
            password.text = '';
          }
        }
      }
      //
    } else
      print('validation failed!!!');
  }

  // //definition of alert_email
  alert_msg(BuildContext context, String label1, String label2, String uname,
      String umail, bool verified) {
    AlertDialog alert = AlertDialog(
      title: Text(label1),
      content: Text(label2),
      actions: [
        ElevatedButton(
            onPressed: () {
              if (verified == false) {
                Navigator.of(context).pop();
              } else {
                verified = false;
                //storing it in the global variables:\nfor later use...
                global_var[0].global_user_name = uname;
                global_var[0].global_user_mail = umail;
                //
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => foody_user_page(
                              uname: uname,
                              umail: umail,
                            ))));
              }
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

  // void validate() {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage('assets/images/rest2.jpg'),
                fit: BoxFit.cover,
              )),
        ),
        Container(
          padding: EdgeInsets.only(right: 42, top: 40),
          child: Column(
            children: [
              Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: email,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          )),
                          filled: true,
                          fillColor: Color.fromARGB(255, 184, 160, 160)
                              .withOpacity(0.5),
                          prefixIcon: Icon(
                            Icons.mail_outlined,
                            color: Colors.black,
                          ),
                          hintText: 'Enter your Email-Address',
                          labelText: 'Email',
                          //style
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.black),
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.black),
                          errorStyle:
                              TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            //return "Email-Address is needed for login";

                            String label1 = 'Email-Address';
                            String label2 =
                                'Email-Address is needed to proceed...';
                            return alert_msg(
                                context, label1, label2, '', '', false);
                          } else {
                            key1 = true;
                            return null;
                          }
                        }),
                    Container(
                      margin: EdgeInsets.only(left: 250),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                    ),
                    TextFormField(
                        controller: password,
                        obscureText: true,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          )),
                          filled: true,
                          fillColor: Color.fromARGB(255, 184, 160, 160)
                              .withOpacity(0.5),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.black,
                          ),
                          hintText: 'Enter your Password',
                          labelText: 'Password',
                          //style
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.black),
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.black),
                          errorStyle:
                              TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            //return "Please enter your Password";
                            String label1 = 'User-Password';
                            String label2 = 'Please type in your password';
                            return alert_msg(
                                context, label1, label2, '', '', false);
                          } else {
                            key2 = true;
                            return null;
                          }
                        }),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 35, left: 30, bottom: 15),
                      //const EdgeInsets.only(top: 10, left: 30, bottom: 0),
                      child: ElevatedButton.icon(
                        onPressed: validate,
                        icon: Icon(Icons.send),
                        label: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login With',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: Colors.white,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class middle_part extends StatelessWidget {
  const middle_part({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 112, 99, 99),
          borderRadius: BorderRadius.circular(50)),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Column(
        children: [
          Text(
            'Login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            'Welcome Back! Happy to Serve You',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}

class top_part extends StatelessWidget {
  const top_part({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          image: DecorationImage(image: AssetImage('assets/images/table.jpg'))),
    );
  }
}

class bottom_nav_bar extends StatelessWidget {
  const bottom_nav_bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: Color.fromARGB(255, 112, 99, 99),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/twitter_logo.png'),
          ),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/fb.logo.png'),
          ),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/google_logo.jpg'),
          ),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/linkedin_logo.png'),
          ),
        ],
      ),
    );
  }
}

class checking_box extends StatelessWidget {
  checking_box({Key? key, required this.data1, required this.data2})
      : super(key: key);
  List dataList = [];
  final String data1, data2;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //future: FireStoreDataBase().getData(),
      future: FireStoreDataBase().comparision(data1, data2),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text(
            "Something went wrong!",
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          dataList = snapshot.data as List;
          return checker(dataList: dataList);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class checker extends StatelessWidget {
  const checker({Key? key, required this.dataList}) : super(key: key);
  final List dataList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: dataList[index]['email'],
            subtitle: dataList[index]['password'],
          );
        });
  }
}




//void validate() async {
  //   if (formkey.currentState!.validate()) {
  //     print('Login validation...');
  //     //
  //     var data =
  //         await FireStoreDataBase().comparision(email.text, password.text);
  //     if (data == null) {
  //       print('nothing found');
  //     } else {
  //       if (data['email'] == email.text) {
  //         //print('Email matched...');
  //         alert_email(context);
  //         //
  //         var name = data['name'];
  //         print('user name = $name');
  //       } else
  //         print('email does not match!!!');
  //       //
  //       if (data['password'] == password.text) {
  //         print('password matched');
  //       } else
  //         print('password does not match!!!');
  //     }
  //     //
  //   } else {
  //     print('not done!!!');
  //   }
  // }


  //////////////////////////////////////////
  ///
  ///
  ///
  ///
  ///  // // //definition of alert_email
  // alert_email(BuildContext context,) {
  //   AlertDialog alert = AlertDialog(
  //     // title: Text('Email has been matched'),
  //     // content: Text('We are good to proceed...'),
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





  //   void validate() async {
  //   if (formkey.currentState!.validate()) {
  //     print('Login validation...');
  //     //
  //     var data =
  //         await FireStoreDataBase().comparision(email.text, password.text);
  //     if (data == null) {
  //       String label1 = 'Email Verification Error';
  //       String label2 = 'Email-Address does not match';
  //       alert_msg(context, label1, label2);
  //       print('nothing found');
  //     } else {
  //       if (data['password'] != password.text) {
  //         String label1 = 'Password Error';
  //         String label2 = 'Password does not match';
  //         alert_msg(context, label1, label2);
  //         print('password does not match...');
  //       } else {
  //         String label1 = 'Verification Ensured';
  //         String label2 = 'We are good to go...Welcome!!!';
  //         alert_msg(context, label1, label2);
  //         print('Everything matched...');
  //         email.text = '';
  //         password.text = '';
  //       }
  //     }
  //     //
  //   } else
  //     print('not done!!!');
  // }

