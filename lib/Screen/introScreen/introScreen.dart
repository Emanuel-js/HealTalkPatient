import 'package:flutter/material.dart';
import '../../index.dart';

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
              color: colors.k_primerygreenColor,
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
    return Scaffold(
      body: Container(
        color: colors.k_bkColor,
        child: Expanded(
            child: Column(children: [
          Intropages(
              size: size,
              con: context,
              title: "Discuss about your problem",
              disc: "We hope you get the best expriance here",
              img: "asset/img/Allura Socializing.png"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: colors.k_seconderypurpleColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              OutlineButton1(
                color: colors.k_primerygreenColor,
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
        ])),
      ),
    );
  }
}

class IntroScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: colors.k_bkColor,
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
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: colors.k_seconderypurpleColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                OutlineButton1(
                  color: colors.k_primerygreenColor,
                  text: "Done",
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => FirstScreen(),
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
    ));
  }
}
