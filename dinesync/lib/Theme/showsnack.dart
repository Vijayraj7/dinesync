import 'package:get/get.dart';

showsnack(String msg) {
  Get.closeAllSnackbars();
  Get.showSnackbar(GetSnackBar(
    message: msg,
    duration: Duration(seconds: 4),
  ));
}
