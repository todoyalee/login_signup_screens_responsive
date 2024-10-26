import 'package:get/get.dart';

class UIController extends GetxController {
  RxBool isObsucre = true.obs;

  void isObsucreActive() {
    isObsucre.value = !isObsucre.value;
  }
}
