import 'dart:io';

import 'package:flutter/material.dart';
import 'package:healTalkpatient/index.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final currentpassword = TextEditingController();
  File _image;
  final newpassword = TextEditingController();
  bool isvisble = true;
  final auth = AuthControlle();

  @override
  Widget build(BuildContext context) {
    bool isedited = false;
    final colors = Appcolor();
    final data = Provider.of<Patient>(context);
    String fullname;
    if (data != null) {
      fullname = data.firstName + "  " + data.lastName;
    }
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
        body: data != null
            ? SafeArea(
                child: SingleChildScrollView(
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
                            data.picture == null
                                ? CircleAvatar(
                                    radius: 70,
                                    backgroundImage: NetworkImage(
                                        "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50.jpg"))
                                : CircleAvatar(
                                    radius: 70,
                                    backgroundImage:
                                        NetworkImage(data?.picture)),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: colors.k_purplecolor,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Container(
                                  child: IconBtn(
                                    onpress: () => {getImgFromGullery()},
                                    icon: Icons.edit,
                                    color: colors.k_white,
                                  ),
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
                      data.email,
                      style: body1(color: colors.k_seconderypurpleColor),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      fullname.toUpperCase(),
                      style: header2(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      BuildText(
                        controler: currentpassword,
                        ispassword: true,
                        isvisble: isvisble,
                        onPress: () {
                          setState(() {
                            isvisble = !isvisble;
                          });
                        },
                        iconSufix: Icons.safety_divider,
                        lebel: "current password",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BuildText(
                        isvisble: isvisble,
                        onPress: () {
                          setState(() {
                            isvisble = !isvisble;
                          });
                        },
                        controler: newpassword,
                        ispassword: true,
                        iconSufix: Icons.safety_divider,
                        lebel: "new password",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Button1(
                        onpress: () => {editPassword(context)},
                        text: "change password",
                        color: colors.k_seconderypurpleColor,
                      )
                    ],
                  )
                ]),
              )
                    // child: StreamBuilder<Patient>(
                    //     stream: UserData().patient,
                    //     builder: (context, snapshot) {
                    //       if (!snapshot.hasData)
                    //         return Container(
                    //             margin: EdgeInsets.only(
                    //                 top: MediaQuery.of(context).size.height * 0.5),
                    //             child: Center(child: CustomProgress().progress()));
                    //       Patient data = snapshot.data;
                    //       String fullname = data.firstName + "  " + data.lastName;

                    //       return
                    //     }),
                    ))
            : CustomProgress().progress());
  }

  Future editPassword(context) async {
    if (currentpassword.text.isEmpty || newpassword.text.isEmpty) {
      DisplayMsg()
          .displayMessage(msg: "lease insert password!", context: context);
    } else if (currentpassword.text.length < 6 || newpassword.text.length < 6) {
      DisplayMsg().displayMessage(
          msg: "Password must be > 6 character", context: context);
    }
    bool iscahnge = auth.changePassword(
        currentpassword.text.trim(), newpassword.text.trim(), context);
    currentpassword.clear();
    newpassword.clear();
  }

  Future getImgFromGullery() async {
    final ImagePicker _picker = ImagePicker();

    // final imge = await ImagePicker().getImage(source: ImageSource.camera);
    final imge = await _picker.pickImage(source: ImageSource.gallery);
    if (imge != null) {
      setState(() {
        _image = File(imge.path);
        FirebaseApi().uploadFile(_image);
      });
    }
  }
}
