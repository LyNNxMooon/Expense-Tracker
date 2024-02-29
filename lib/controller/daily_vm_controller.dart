import 'package:get/get.dart';

class DailyVMController extends GetxController {
  RxString date =
      "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}"
          .obs;

  RxDouble total = 0.0.obs;
}
