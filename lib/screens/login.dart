import 'dart:math';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:last/componant/myText.dart';
import 'package:last/componant/squareTile.dart';
import 'package:last/screens/Homepage.dart';

class login extends StatelessWidget {
  login({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  double _sigmaX = 5; // from 0-10
  double _sigmaY = 5; // from 0-10
  double _opacity = 0.2;
  double _width = 350;
  double _height = 300;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(alignment: Alignment.center, children: [
                  Image.asset(
                    '',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.18),
                        const Text("Login ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        ClipRect(
                            child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: _sigmaX, sigmaY: _sigmaY),
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 1)
                                            .withOpacity(_opacity),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height: MediaQuery.of(context).size.height *
                                        0.60,
                                    child: Form(
                                      key: _formKey,
                                      child: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // username textfield
                                            MyTextField(
                                              controller: usernameController,
                                              hintText: 'Email',
                                              obscureText: false,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            MyTextField(
                                              controller: usernameController,
                                              hintText: 'password',
                                              obscureText: false,
                                            ),

                                            const SizedBox(height: 10),

                                            // sign in button
                                            // MyButton(
                                            //   onTap: (() {
                                            //     if (_formKey.currentState!.validate()) {
                                            //       Navigator.push(
                                            //         context,
                                            //         MaterialPageRoute(
                                            //             builder: (context) => Signup()),
                                            //       );
                                            //     } else {
                                            //       print('not valid');
                                            //   }
                                            // }),

                                            const SizedBox(height: 10),

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
                                                        fontSize: 16),
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

                                            const SizedBox(height: 10),

                                            ElevatedButton(
                                              child: Text(' Send Code'),
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0), // Adjust the radius as needed
                                                  ),
                                                  backgroundColor:
                                                      Colors.purple,
                                                  elevation: 10,
                                                  minimumSize: Size(130, 40)),
                                              onPressed: () {
                                                String randomNumber =
                                                    generateRandomNumber();
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    TextEditingController
                                                        _textEditingController =
                                                        TextEditingController();
                                                    return AlertDialog(
                                                      title: Text(
                                                          'verification CODE'),
                                                      content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            randomNumber,
                                                            style: TextStyle(
                                                              fontSize: 40,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          SizedBox(height: 20),
                                                          TextField(
                                                            controller:
                                                                _textEditingController,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  ' Please Enter 4 Digit pin ',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      actions: <Widget>[
                                                        ElevatedButton(
                                                          child: Text(
                                                            'Verify',
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25.0), // Adjust the radius as needed
                                                                  ),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .purple,
                                                                  elevation: 10,
                                                                  minimumSize:
                                                                      Size(130,
                                                                          40)),
                                                          onPressed: () {
                                                            String
                                                                enteredNumber =
                                                                _textEditingController
                                                                    .text;
                                                            if (enteredNumber ==
                                                                randomNumber) {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          Homepage(),
                                                                ),
                                                              );
                                                            } else {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Wrong'),
                                                                    content: Text(
                                                                        'This number not vaild '),
                                                                    actions: <
                                                                        Widget>[
                                                                      ElevatedButton(
                                                                        child: Text(
                                                                            'Ok'),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),

                                            ElevatedButton(
                                              onPressed: () {},
                                              child: Text(
                                                // imagePath: 'assets/images/google.png',
                                                "Login with Google",
                                                
                                              ),
                                               style: ElevatedButton
                                                              .styleFrom(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15), // Adjust the radius as needed
                                                                  ),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .purple,
                                                                  elevation: 15,)
                                            ),

                                            // google + apple sign in buttons
                                            // Padding(
                                            //   padding: const EdgeInsets.all(8.0),
                                            //   child: Column(
                                            //     mainAxisSize: MainAxisSize.min,
                                            //     mainAxisAlignment: MainAxisAlignment.center,
                                            //     children: [
                                            //       // facebook button
                                            //       // SquareTile(
                                            //       //     imagePath:
                                            //       //         'assets/images/facebook.png',
                                            //       //     title: "Continue with Facebook"),
                                            //       // SizedBox(height: 10),

                                            //       // google button

                                            //       ElevatedButton(
                                            //         onPressed: () {
                                            //           signInWithGoogle();
                                            //         },
                                            //         child: Text(
                                            //           // imagePath: 'assets/images/google.png',
                                            //           "Login with Google",
                                            //         ),
                                            //       ),

                                            // SizedBox(height: 10),

                                            // apple button
                                            // SquareTile(
                                            //     imagePath: 'assets/images/apple.png',
                                            //     title: "Continue with Apple"),
                                          ],
                                        ),
                                      ),
                                    ))))
                      ])
                ]))));
  }

  static String generateRandomNumber() {
    Random random = Random();
    int number =
        random.nextInt(9000) + 1000; // توليد رقم عشوائي بين 1000 و 9999
    return number.toString();
  }
}
