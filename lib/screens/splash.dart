import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:last/screens/onBoarding.dart';


class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}


class _splashState extends State<splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();


////لشاشة الكاملة
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);



    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => onBoarding(),
        ),
      );
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.green
          // gradient: LinearGradient(
          //     colors: [Colors.green, Color(0xffD6D5D5)],
          //     begin: Alignment.bottomLeft,
          //     end: Alignment.topRight),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/white.png', height: 220,width: 200,color: Colors.purple,),
              // Spacer(),
              SizedBox(height: 220,),
              Text(
                'SPORT OVERFLOW',
                style: TextStyle(fontSize: 40, color: Colors.white,fontFamily: 'SofiaPro'),
              )
            ],
          ),
        ),
      ),
    
    );
  }
}
