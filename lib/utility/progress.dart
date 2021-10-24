import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomProgress {
  Widget progress({double rad = 50}) {
    return Center(
      child: CircleAvatar(
          radius: rad, backgroundImage: AssetImage('asset/icon/progress.gif')),
    );
  }
}
