import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newss_app/controller/register_page_controller.dart';
import 'package:newss_app/view/screens/login_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({
    Key? key,
  }) : super(key: key);
  final Registerpagecontroller registerpagecontroller =
    Get.put(Registerpagecontroller());
  final _formKeys = GlobalKey<FormState>();
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  var rememberValue = false;
  var name, surname, email, password, token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Kayıt Ol',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Form(
              key: _formKeys,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: (val) {
                            registerpagecontroller.name = val;
                          },
                          validator: (value) => value.toString().isEmpty
                              ? "İsminizi Girin"
                              : (nameRegExp.hasMatch(value.toString())
                                  ? null
                                  : "Geçerli isim giriniz"),
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: 'Adınız',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          onChanged: (val) {
                            registerpagecontroller.surname = val;
                          },
                          validator: (value) => (value.toString().isEmpty)
                              ? "Soyisiminizi Giriniz"
                              : (nameRegExp.hasMatch(value.toString())
                                  ? null
                                  : 'Geçerli soyisim giriniz'),
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: 'Soyadınız',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (val) {
                      registerpagecontroller.email = val;
                    },
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Lütfen geçerli bir e-mail giriniz",
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'E-mail adresini giriniz',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (val) {
                      registerpagecontroller.password = val;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen geçerli bir şifre giriniz';
                      }
                      return null;
                    },
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Şifrenizi girin',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKeys.currentState!.validate()) {
                        registerpagecontroller.register();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    ),
                    child: const Text(
                      'Kayıt Ol',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Zaten bir hesabın var mı?'),
                      TextButton(
                        onPressed: () {
                          Get.off(LoginPage());
                        },
                        child: const Text('Giriş Yap'),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
