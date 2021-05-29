import 'package:flutter/material.dart';
import '../../index.dart';

class DetailScreen extends StatelessWidget {
  final colors = Appcolor();
  final name;
  final gender;
  final expriance;
  final rate;
  final focus;
  final detail;
  final id;
  final img;
  final disc;
  DetailScreen(
      {this.name,
      this.gender,
      this.expriance,
      this.rate,
      this.focus,
      this.detail,
      this.img,
      this.disc,
      this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: backAppBar(context: context, color: colors.k_white),
        backgroundColor: colors.k_white,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 30,
              // ),

              Center(
                  // Todo profile image
                  child: CircleAvatar(
                radius: 92,
                backgroundColor: colors.k_white,
                child: Hero(
                  tag: "profile-${id}",
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: NetworkImage(img),
                  ),
                ),
              )),
              //todo name
              SizedBox(
                height: 30,
              ),
              Text(
                name,
                style: header1(),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                detail,
                style: body1(),
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  // margin: EdgeInsets.only(left: 30),
                  child: ListView.builder(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Listdetail(
                        title: expriance.toString(),
                        disc: disc.toString(),
                        icon: Icons.calendar_today_rounded,
                        color: colors.k_white,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
