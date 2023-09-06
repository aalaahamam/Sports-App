import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:last/screens/Homepage.dart';

class login extends StatefulWidget {
  login({super.key});

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  double _sigmaX = 5; // from 0-10
  double _sigmaY = 5; // from 0-10
  double _opacity = 0.2;
  double _width = 350;
  double _height = 300;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  String _verificationCode = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/login.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                  ),
                  const Text(
                    "Login ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: _sigmaX,
                        sigmaY: _sigmaY,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color:
                              Color.fromRGBO(0, 0, 0, 1).withOpacity(_opacity),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.63,
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // phone number textfield
                                ////////////////////////////////////
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.white,
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      // controller: _phoneNumberController,
                                      decoration: InputDecoration(
                                        hintText: "(+20) :",
                                          prefixIcon: Icon(Icons.phone_android),
                                          // labelText: "Enter your phone"
                                          ),
                                
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter a phone number';
                                        } else if (!value.contains("(+20)")) {
                                          return "invalid number should contain (+20)";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),

                                /////////////////////////////////////////////
                                SizedBox(height: 10),

                                // or continue with
                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        'Or',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 10),

                                ElevatedButton(
                                  child: Text('Send Code'),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    backgroundColor: Colors.purple,
                                    elevation: 10,
                                    minimumSize: Size(130, 40),
                                  ),
                                  /////////////////////////////////
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      String randomNumber =
                                          generateRandomNumber();
                                      setState(() {
                                        _verificationCode = randomNumber;
                                      });
                                      ////////////////////////////////////////////

                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          TextEditingController
                                              _textEditingController =
                                              TextEditingController();
                                          return AlertDialog(
                                            title: Text('Verification Code'),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  randomNumber,
                                                  style: TextStyle(
                                                    fontSize: 40,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 20),

                                                ////////////////////////////////
                                                TextFormField(
                                                  controller:
                                                      _textEditingController,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Please Enter 4 Digit PIN',
                                                  ),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Please enter the verification code';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ],
                                            ),

                                            //////////////////////////////////////
                                            actions: <Widget>[
                                              ElevatedButton(
                                                child: Text('Verify'),
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                  backgroundColor:
                                                      Colors.purple,
                                                  elevation: 10,
                                                  minimumSize: Size(130, 40),
                                                ),

                                                ////////////////////////////////////
                                                onPressed: () {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    String enteredNumber =
                                                        _textEditingController
                                                            .text;
                                                    if (enteredNumber ==
                                                        randomNumber) {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Homepage(),
                                                        ),
                                                      );
                                                    } else {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title:
                                                                Text('Wrong'),
                                                            content: Text(
                                                                'This number is not valid'),
                                                            actions: <Widget>[
                                                              ElevatedButton(
                                                                child:
                                                                    Text('Ok'),
                                                                onPressed: () {
                                                                     Navigator.of(context).popUntil((route) => route.isFirst);

                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  }
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                                SizedBox(height: 20),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String generateRandomNumber() {
    Random random = Random();
    int number = random.nextInt(9000) +
        1000; // Generate a random number between 1000 and 9999
    return number.toString();
  }
}
