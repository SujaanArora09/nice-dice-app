import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nice_dice/2_dice_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imgPath = "assets/1.png";
  String imgpath2 = "assets/yellowback.png";
  void roll() {
    for (int i = 0; i < 20; i++) {
      Future.delayed(Duration(milliseconds: i * 50), () {
        setState(() {
          var r = Random();
          imgPath = "assets/${1 + r.nextInt(6)}.png";
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image(
          image: AssetImage(imgpath2),
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () { },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              primary: Colors.orange),
                          child: const Text(
                            "One",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TwoDicePage()));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              primary: Colors.orange),
                          child: const Text(
                            "Two",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
                    ],
                  ),
                ),
                Image(image: AssetImage(imgPath), height: 100),
                Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  child: ElevatedButton(
                      onPressed: () {
                        roll();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          primary: Colors.orange),
                      child: const Text(
                        "Roll",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )),
                ),
              ],
            )),
          ),
        ),
      ],
    );
  }
}
