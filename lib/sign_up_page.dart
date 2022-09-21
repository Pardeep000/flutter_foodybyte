import 'package:flutter/material.dart';
import 'package:pkapp3/database.dart';
import 'package:pkapp3/login_page.dart';
//
import 'package:email_validator/email_validator.dart';

class sign_up_page extends StatelessWidget {
  const sign_up_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sign_up_body(),
    );
  }
}

class sign_up_body extends StatelessWidget {
  const sign_up_body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image(
            image: AssetImage('assets/images/rest3.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 53, 47, 47).withOpacity(0.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/images/logo.jpg'),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Register with FoodyBite',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              Text('for Spicy Bites',
                  style: TextStyle(
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              form_part(),
            ],
          ),
        )
      ],
    );
  }
}

class form_part extends StatefulWidget {
  form_part({Key? key}) : super(key: key);

  @override
  State<form_part> createState() => _form_partState();
}

class _form_partState extends State<form_part> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  //
  TextEditingController data1 = TextEditingController();
  TextEditingController data2 = TextEditingController();
  TextEditingController data3 = TextEditingController();
  TextEditingController data4 = TextEditingController();

  void validate() async {
    if (formkey.currentState!.validate()) {
      print('Validation ensured...');
      //
      var data = await FireStoreDataBase().comparision(data2.text, data3.text);
      if (data != null) {
        String label1 = 'Registration Error';
        String label2 = 'User with this email-Addess already exist...';
        alertbox(context, label1, label2);
      } else {
        FireStoreDataBase().register(data1.text, data2.text, data3.text);
        String label1 = 'Validation Ensured';
        String label2 = 'User has been registered...';
        alertbox(context, label1, label2);
        //
        data1.text = '';
        data2.text = '';
        data3.text = '';
        data4.text = '';
      }
      //
    } else {
      print('validation failed!!!');
    }
  }

  //definition of alertbox
  alertbox(BuildContext context, String label1, String label2) {
    AlertDialog alert = AlertDialog(
      title: Text(label1),
      content: Text(label2),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'))
      ],
    );
    //
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  // String? customValidtaor(String? fieldContent) =>
  //     fieldContent!.isEmpty ? 'Ce champ est obligatoire.' : null;
  //
  // String? customValidtaor(String? fieldContent) {
  //   //fieldContent!.isEmpty ? 'Ce champ est obligatoire.' : null;
  //   if (fieldContent!.isEmpty || fieldContent == null) {
  //     return 'ok returning error';
  //   } else
  //     return null;
  // }
  String? func1(String? value) {
    if (value!.isEmpty || value == null) {
      return 'Please enter your name';
    } else
      return null;
  }

  String? func2(String? value) {
    if (value!.isEmpty || value == null) {
      return 'Email Address is needed to proceed...';
    } else if (!EmailValidator.validate(value, true)) {
      return "Invalid Email Address";
    } else
      return null;
  }

  String? func3(String? value) {
    if (value!.isEmpty || value == null) {
      return 'Please enter your password';
    } else if (value.length <= 5) {
      return 'password length <= 5 not allowed';
    } else
      return null;
  }

  String? func4(String? value) {
    if (value!.isEmpty || value == null) {
      return 'Please confirm your password';
    } else if (data3.text != data4.text) {
      return 'password does not matches';
    } else
      return null;
  }
  //

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.7,
      child: SingleChildScrollView(
        child: Form(
            key: formkey,
            child: Column(
              children: [
                custom_text_field(
                  hint: 'Enter your full name',
                  label: 'User-Name',
                  next: Icons.person,
                  decision: false,
                  error_msg: 'Enter your complete name',
                  inputkey: data1,
                  func: func1,
                ),
                custom_text_field(
                  hint: 'Enter your Email-Address',
                  label: 'Email-Address',
                  next: Icons.mail_outline_rounded,
                  decision: false,
                  error_msg: 'Emal-Address is needed to proceed',
                  inputkey: data2,
                  func: func2,
                ),
                custom_text_field(
                  hint: 'Type in Password',
                  label: 'Pasword',
                  decision: true,
                  next: Icons.key,
                  error_msg: 'please type in your password',
                  inputkey: data3,
                  func: func3,
                ),
                custom_text_field(
                  hint: 'Type in Same Password',
                  label: 'Confirm-Pasword',
                  next: Icons.key,
                  decision: true,
                  error_msg: 'please confirm your password',
                  inputkey: data4,
                  func: func4,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: validate,
                          icon: Icon(Icons.edit),
                          label: Text(
                            'Register',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            data1.clear();
                            data2.clear();
                            data3.clear();
                            data4.clear();
                          },
                          icon: Icon(Icons.clear),
                          label: Text(
                            'Clear',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                last_text(),
                SizedBox(
                  height: 15,
                ),
                back_button(),
              ],
            )),
      ),
    );
  }
}

class custom_text_field extends StatelessWidget {
  const custom_text_field({
    Key? key,
    required this.hint,
    required this.label,
    required this.next,
    required this.decision,
    required this.error_msg,
    required this.inputkey,
    required this.func,
  }) : super(key: key);
  final String hint, label, error_msg;
  final IconData next;
  final bool decision;
  final TextEditingController inputkey;
  //
  final String? Function(String?)? func;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: TextFormField(
        controller: inputkey,
        obscureText: decision,
        style: TextStyle(fontSize: 20, color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 61, 56, 56).withOpacity(0.5),
          prefixIcon: Icon(next),
          hintText: hint,
          labelText: label,
          //
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          hintStyle: TextStyle(fontSize: 20, color: Colors.white),
          errorStyle: TextStyle(
              fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
          //
          border:
              new OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        ),
        //validation:\n
        validator: func,
      ),
    );
  }
}

class last_text extends StatelessWidget {
  const last_text({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            'Already have an Account?',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => login_page()));
            },
            child: Text('Login'),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
          )
        ],
      ),
    );
  }
}

class back_button extends StatelessWidget {
  const back_button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            primary: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
        label: Text(
          'Main-Menu',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ));
  }
}
