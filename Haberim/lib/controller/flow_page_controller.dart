import 'package:get/get.dart';

class FlowpageController extends GetxController {
  var email = Get.arguments;
  var Tab_index = 0;
  var usercontroller;
  void changetabindex(index) {//Tıklandığında sayfalar arası geçişi sağlar
    Tab_index = index;
    update();
  }
}
