import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last/Data/list/HomePageList.dart';
import 'package:last/screens/onBoarding.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color mainColor = Color(0xFFFF5050);
    final Color secondColor = Color.fromARGB(255, 221, 214, 214);
    final Color thirdColor = Color.fromARGB(255, 236, 232, 232);
        var color = 0xff453658;

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(color),
      body: SafeArea(
        
        child: Column(
          children: [
            Container(
              color: Color(color),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: size.height * 1 / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  //   // child: Icon(
                  //   //   Icons.arrow_back_ios_rounded,
                  //   //   color: Colors.yellow,
                  //   // ),
                  // ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SPORTS ',
                        style: GoogleFonts.actor(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        'images/white.png',
                        height: 45,
                        width: 45,
                        color: Colors.white,
                      ),
                      Text(
                        'OVERFLOW',
                        style: GoogleFonts.actor(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              
              child: GridView.builder(
                
                
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: size.height / 2 - size.height * 1 / 15),
                itemBuilder: (context, index) {
                  return Expanded(
                      child: InkWell(
                    onTap: () {
                      index != 0
                          ? showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Center(
                                      child: Text(
                                    'Coming Soon ...',
                                    style:
                                        GoogleFonts.aBeeZee(fontSize: 28),
                                  )),
                                  content: Text('unavailable now'),
                                );
                              })
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => onBoarding(),
                              ),
                            );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: thirdColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: secondColor,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            HomePageList[index]['image'],
                            height: 200,
                            width: 800,
                            
                          ),
                          Text(
                            HomePageList[index]['name'],
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
