import 'package:flutter/material.dart';
import 'package:healTalkpatient/Color/color.dart';
import "../../Commponent/Button.dart";
import 'intropage.dart';

class IntroScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Appcolor();

    return SafeArea(
      child: Expanded(
        child: Column(
          children: [
            Intropages(
                con: context,
                size: size,
                title: "Welcome To Heal Talk",
                disc: "We hope you get the best expriance here",
                img: "asset/img/Happy Bunch Standing.png"),
            OutlineButton1(
              color: colors.primarygreenColor,
              text: "Next",
              onpress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => IntroScreen2()));
              },
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class IntroScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    final size = MediaQuery.of(context).size;
    return Container(
      color: colors.bkColor,
      child: Expanded(
          child: Column(children: [
        Intropages(
            size: size,
            con: context,
            title: "Discuss about your problem",
            disc: "We hope you get the best expriance here",
            img: "asset/img/Allura Socializing.png"),
        OutlineButton1(
          color: colors.primarygreenColor,
          text: "Next",
          onpress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => IntroScreen3()));
          },
        ),
        SizedBox(
          height: 20,
        )
      ])),
    );
  }
}

class IntroScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    final size = MediaQuery.of(context).size;
    return Container(
      color: colors.bkColor,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Intropages(
                size: size,
                con: context,
                title: "Get help",
                disc: "We hope you get the best expriance here",
                img: "asset/img/Allura Freelancing.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Expanded(
                //   child: InkWell(
                //     child: Icon(
                //       Icons.arrow_back,
                //       color: colors.primarygreenColor,
                //       size: 2,
                //     ),
                //   ),
                // ),
                OutlineButton1(
                  color: colors.primarygreenColor,
                  text: "Next",
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => IntroScreen3(),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ]),
    );
  }
}
