import 'package:fluttertoast/fluttertoast.dart';

class DisplayMsg {
  final String msg;
  final context;

  DisplayMsg({this.msg, this.context});
  void displayMessage(String msg, context) {
    Fluttertoast.showToast(msg: msg);
  }
}
