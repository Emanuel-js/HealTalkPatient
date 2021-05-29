import 'package:flutter/material.dart';
import 'package:healTalkpatient/index.dart';

class Button1 extends StatelessWidget {
  final colors = Appcolor();
  Button1({this.color, this.text, this.onpress});
  final color;
  final text;
  final onpress;

  ///
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return RaisedButton(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.02, horizontal: size.width * 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.2)),
      ),
      onPressed: () {
        onpress();
      },
      color: color,
      child: Text(
        text,
        style: TextStyle(color: colors.k_white),
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  final colors = Appcolor();
  Button2({this.color, this.text, this.onpress});
  final color;
  final text;
  final onpress;

  ///
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.2)),
      ),
      onPressed: () {
        onpress();
      },
      color: color,
      child: Text(
        text,
        style: TextStyle(color: colors.k_white),
      ),
    );
  }
}

class OutlineButton1 extends StatelessWidget {
  OutlineButton1({this.color, this.text, this.onpress});
  final color;
  final text;
  final onpress;

  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    final size = MediaQuery.of(context).size;
    return OutlineButton(
      onPressed: () {
        onpress();
      },
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.02, horizontal: size.width * 0.1),
      child: Text(
        text,
        style: TextStyle(
          color: colors.k_primerygreenColor,
          fontWeight: FontWeight.w900,
        ),
      ),
      borderSide: BorderSide(color: colors.k_primerygreenColor, width: 3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.2)),
      ),
    );
  }
}

class IconBtn extends StatelessWidget {
  IconBtn({this.icon, this.color, this.onpress});

  final icon;
  final color;
  final onpress;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: color,
      ),
      onPressed: () {
        onpress();
      },
    );
  }
}

class CheckBox1 extends StatelessWidget {
  final colors = Appcolor();
  CheckBox1({this.isChecked, this.title, this.onChange});

  final isChecked;
  final title;
  final onChange;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title),
      value: isChecked,
      checkColor: colors.k_white,
      onChanged: (value) {
        onChange(value);
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
