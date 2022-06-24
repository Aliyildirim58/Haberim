import 'package:get/get.dart';
import 'package:newss_app/services/authservice.dart';
import 'package:newss_app/view/screens/login_page.dart';

class Registerpagecontroller extends GetxController {
  RxString _name = "".obs;
  RxString _surname = "".obs;
  RxString _email = "".obs;
  RxString _password = "".obs;
  var token;

  //set token(value) => _token.value = value;
  set name(value) => _name.value = value;
  set surname(value) => _surname.value = value;
  set email(value) => _email.value = value;
  set password(value) => _password.value = value;

 // get token => _token.value;
  get name => _name.value;
  get surname => _surname.value;
  get email => _email.value;
  get password =>_password.value;

  register() async {//kullanıcı kayıt fonksiyonu
    await AuthService().adduser(
      name,
      surname,
      email,
      password,
    ).then((val) {
      print(val);
      if (val.data['success']) {
        token = val.data['token'];
        Get.snackbar('Başarılı', 'Kayıt Edildi');
        Get.to(
          LoginPage(),
          duration: const Duration(seconds: 1),
        );
      } else {
        Get.snackbar('Hata', 'Bu email zaten kullanılıyor');
      }
    });
  }
}
