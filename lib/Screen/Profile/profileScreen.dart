import 'package:flutter/material.dart';
import 'package:healTalkpatient/index.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final password = TextEditingController();
    final confpassword = TextEditingController();
    bool isedited = false;
    final colors = Appcolor();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.k_primerygreenColor,
        centerTitle: true,
        leading: IconBtn(
          icon: Icons.arrow_back_ios_new,
          color: colors.k_white,
          onpress: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Edit your profile",
          style: header2(color: colors.k_white),
        ),
        elevation: 0,
        // flexibleSpace: SomeWidget(),
      ),
      body: SafeArea(
          child: Container(
        alignment: Alignment.topCenter,
        child: Column(children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                color: colors.k_primerygreenColor,
                width: double.infinity,
                height: 60,
              ),
              Container(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('asset/img/pic.jpg'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: colors.k_purplecolor,
                            borderRadius: BorderRadius.circular(30)),
                        child: IconBtn(
                          icon: Icons.edit,
                          color: colors.k_white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              "Amanuel Awol",
              style: header1(color: colors.k_seconderypurpleColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              "test@email.com",
              style: body1(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                BuildText(
                  controler: password,
                  ispassword: false,
                  iconSufix: Icons.safety_divider,
                  isvisble: false,
                  lebel: "Password",
                ),
                SizedBox(
                  height: 20,
                ),
                BuildText(
                  controler: confpassword,
                  ispassword: false,
                  iconSufix: Icons.safety_divider,
                  isvisble: false,
                  lebel: "ConfPassword",
                ),
                SizedBox(
                  height: 10,
                ),
                Button1(
                  text: "Edit",
                  color: colors.k_seconderypurpleColor,
                )
              ],
            ),
          )
        ]),
      )),
    );
  }
}
