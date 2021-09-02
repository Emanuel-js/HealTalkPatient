import 'package:flutter/material.dart';
import '../../index.dart';

class DetailScreen extends StatelessWidget {
  final colors = Appcolor();
  final Doctor data;

  DetailScreen({this.data});

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
                  child: Hero(
                tag: "profile-${data.dId}",
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: NetworkImage(data.img),
                ),
              )),
              //todo name
              SizedBox(
                height: 30,
              ),
              Text(
                data.fullName,
                style: header1(),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                data.detail,
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
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Listdetail(
                        title: data.expriance.toString(),
                        disc: data.detail.toString(),
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
