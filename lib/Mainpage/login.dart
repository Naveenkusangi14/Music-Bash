import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/Databasehelper/Auth_Helper.dart';
import 'package:spotify/Mainpage/signup.dart';

import '../views/home/home_screen.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
   LoginPage({super.key});
   final _form = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor:const Color.fromARGB(255, 22, 171, 99),

      // Colors.deepPurple.shade700.withOpacity(0.8),
    body: Container(
      decoration: const BoxDecoration(
        color: Colors.black,
    image: DecorationImage(
     image: NetworkImage('https://ik.imagekit.io/qi9uu5kec/2023_3_largeimg_802427310.jpg?updatedAt=1679339886463'),
      fit: BoxFit.cover,
    ),
  ),
 child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 250.0,sigmaY: 200.0),
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Image.network('https://ik.imagekit.io/qi9uu5kec/5ece4ff9123d6d0004ce5fcccccccccc89__1_.png?updatedAt=1679314154774'),
        ),
        const SizedBox(height: 18),
        Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: _email,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    fillColor: Colors.white60,
                    filled: true,
                    iconColor: Colors.black,
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
                    labelText: 'Enter E mail',
                    labelStyle: TextStyle(color: Colors.black87),
                    hintText: 'Enter Your E mail Id',
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty || !val.contains('@')) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: _password,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    fillColor: Colors.white60,
                    filled: true,
                    iconColor: Colors.black,
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
                    labelText: 'Enter Password',
                    labelStyle: TextStyle(color: Colors.black87),
                    hintText: 'Enter Your Password', ),
                  validator: (val) {
                    if (val == null || val.isEmpty || val.length < 8) {
                      return 'Enter valid Password';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(child: const Text('Login',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold
            ),),
          onPressed: (){
            AuthHelper state = Provider.of<AuthHelper>(context , listen:false);
            state.login(_email.text, _password.text);
          }),
         ),
        Text.rich(TextSpan(
                  text: 'If you dont have account ?',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                      
                  children: [
                    TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Signup()),),
                              )
                  ]),
                  )
      ],
    ),
  ),
)
)
);


  }
}

                  