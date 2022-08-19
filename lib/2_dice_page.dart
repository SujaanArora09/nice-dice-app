import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nice_dice/home_page.dart';

class TwoDicePage extends StatefulWidget {
  const TwoDicePage({Key? key}) : super(key: key);

  @override
  State<TwoDicePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TwoDicePage> {
  String imgPath = "assets/1.png";
  String imgPath3 = "assets/1.png";
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

  void roll2() {
    for (int i = 0; i < 20; i++) {
      Future.delayed(Duration(milliseconds: i * 50), () {
        setState(() {
          var r = Random();
          imgPath3 = "assets/${1 + r.nextInt(6)}.png";
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyHomePage()));
                          },
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
                          onPressed: () {},
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    Image(image: AssetImage(imgPath), height: 100),
                    Image(image: AssetImage(imgPath3), height: 100),
                    const SizedBox(
                      width: 50,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  child: ElevatedButton(
                      onPressed: () {
                        roll();
                        roll2();
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
