import 'package:get/get.dart';
import 'package:newss_app/services/authservice.dart';
import 'package:newss_app/view/screens/flow_page.dart';

class Loginpagecontroller extends GetxController {
  RxBool rememberValue = false.obs;
  RxString _token = "".obs;
  RxString _email = "".obs;
  RxString _password = "".obs;

  set token(value) => _token.value = value;
  set email(value) => _email.value = value;
  set password(value) => _password.value = value;

  get token => _token.value;
  get email => _email.value;
  get password => _password.value;
  
  login()async{//Kullanıcı giriş yaparken önyüz için gerekli sorgu
    await AuthService().login(email, password).then((val) {
      print(val);
      if (val.data["success"]) {
        token = val.data['token'];
        Get.snackbar("Giriş Başarılı","Hoşgeldiniz",duration: Duration(seconds: 2));
      Get.off(Flowpage(),duration: Duration(seconds: 1));
      }
      else {
        print("HATA");
        Get.snackbar("Hata", "Başarısız Giriş");
      }
    });
  }
}
