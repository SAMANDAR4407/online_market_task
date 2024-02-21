import 'package:fluttertoast/fluttertoast.dart';

void showToast(){
  Fluttertoast.cancel();
  Fluttertoast.showToast(msg: 'click');
}