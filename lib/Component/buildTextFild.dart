import 'package:flutter/material.dart';
import 'package:healTalkpatient/index.dart';

class BuildText extends StatelessWidget {
  BuildText({
    this.isvisble,
    this.iconPrifix,
    this.iconSufix,
    this.lebel,
    this.controler,
    this.onPress,
    this.keybordType,
    this.ispassword = true,
  });

  final isvisble;
  final iconPrifix;
  final iconSufix;
  final controler;
  final lebel;
  final onPress;
  final keybordType;
  final ispassword;
  final colors = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextField(
          controller: controler,
          decoration: InputDecoration(
              filled: true,
              fillColor: colors.k_gray,
              prefixIcon: iconPrifix,
              suffixIcon: _textClear(),
              labelText: lebel,
              border: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
                //borderSide: const BorderSide(),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide:
                    BorderSide(width: 1, color: colors.k_seconderypurpleColor),
              )
              // errorText:
              //     controler.text.isEmpty ? "Please input ${lebel}" : null,
              // border: OutlineInputBorder(),
              ),
          keyboardType: keybordType,
          textInputAction: TextInputAction.done,
          obscureText: isvisble,
        ));
  }

  Widget _textClear() => ispassword
      ? IconButton(
          color: colors.k_primerygreenColor,
          onPressed: () {
            onPress();
          },
          icon: isvisble ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        )
      : controler.text.isEmpty
          ? Container(
              width: 0,
            )
          : IconButton(
              icon: Icon(
                Icons.close,
                color: colors.k_redColor,
              ),
              onPressed: () => controler.clear(),
            );
}
