import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newss_app/view/screens/login_page.dart';
void main() {
  runApp(const GetMaterialApp(home: newss_app(),debugShowCheckedModeBanner: false,));
}

// ignore: camel_case_types
class newss_app extends StatelessWidget{
  const newss_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Flowpage();
    return LoginPage();
  }

}
