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
  late AnimationController _animationController;
  late Animation<double> _imageAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _imageAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 0.5, curve: Curves.easeIn),
      ),
    );

    _textAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1, curve: Curves.easeIn),
      ),
    );

    _animationController.forward();

    
    Future.delayed(Duration(seconds: 4), () {
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
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splashwp.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _imageAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _imageAnimation.value,

                    child: Transform.scale(
                      scale: _imageAnimation.value,
                      child: Image.asset(
                        'assets/images/white.png',
                        height: 220,
                        width: 200,
                        color: Color.fromARGB(255, 53, 4, 61),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 220,
              ),
              AnimatedBuilder(
                animation: _textAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _textAnimation.value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - _textAnimation.value)),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'SPORTS ',
                              style: TextStyle(
                                fontSize: 40,
                                color: Color.fromARGB(255, 53, 4, 61),
                                fontFamily: 'SofiaPro',
                              ),
                            ),
                            TextSpan(
                              text: 'OVERFLOW',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontFamily: 'SofiaPro',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
