import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:newss_app/controller/loginpage_controller.dart';
import 'register_page.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final Loginpagecontroller loginpagecontroller =
      Get.put(Loginpagecontroller());
  LoginPage({
    Key? key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  

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
              'Haberim',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white70),
            ),
            const SizedBox(
              height: 60,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      loginpagecontroller.email = value;
                    },
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Lütfen geçerli bir e-mail adresi giriniz",
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Bir e-mail adresi girin',
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
                    onChanged: (value) {
                      loginpagecontroller.password = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen Şifrenizi Girin';
                      }
                      return null;
                    },
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Şifrenizi Girin',
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
                      if (_formKey.currentState!.validate()) {
                          loginpagecontroller.login();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    ),
                    child: const Text(
                      'Giriş Yap',
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
                      const Text('Hesabın yok mu?'),
                      TextButton(
                        onPressed: () {
                          Get.off(RegisterPage());
                        },
                        child: const Text('Kayıt ol'),
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
