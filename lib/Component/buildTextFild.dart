import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  BuildText(
      {this.isvisble,
      this.iconPrifix,
      this.iconSufix,
      this.lebel,
      this.controler,
      this.onPress,
      this.keybordType,
      this.ispassword = true});

  final isvisble;
  final iconPrifix;
  final iconSufix;
  final controler;
  final lebel;
  final onPress;
  final keybordType;
  final ispassword;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
            controller: controler,
            decoration: InputDecoration(
              prefixIcon: iconPrifix,
              suffixIcon: _textClear(),
              labelText: lebel,
              // errorText:
              //     controler.text.isEmpty ? "Please input ${lebel}" : null,
              border: OutlineInputBorder(),
            ),
            keyboardType: keybordType,
            textInputAction: TextInputAction.done,
            obscureText: isvisble));
  }

  Widget _textClear() => ispassword
      ? IconButton(
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
              icon: Icon(Icons.close),
              onPressed: () => controler.clear(),
            );
}
