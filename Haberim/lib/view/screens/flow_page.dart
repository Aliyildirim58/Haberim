import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:newss_app/controller/flow_page_controller.dart';
import 'package:newss_app/view/screens/home_page.dart';
import 'package:newss_app/view/screens/post_page.dart';
import 'package:newss_app/view/screens/profile_page.dart';
import 'package:newss_app/view/screens/settings_page.dart';

class Flowpage extends StatelessWidget {
  FlowpageController controller = Get.put(FlowpageController());
  Widget build(BuildContext context) {
    return GetBuilder<FlowpageController>(builder: (controller) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 30, 35, 41),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/haberim.png',
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.2,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 11, 14, 17),
          elevation: 0.0,
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 11, 14, 17),
          ),
        ),
        body: IndexedStack(
          index: controller.Tab_index,
          children: [Homepage(), Profilepage(),Postpage(),Settingspage()],//Postpage()
        ),
        // ignore: prefer_const_literals_to_create_immutables
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 11, 14, 17),
            currentIndex: controller.Tab_index,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: controller.changetabindex,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.yellowAccent,
            type: BottomNavigationBarType.fixed,
            items: [
              _bottomnavigatorbaritem(
                  icon: CupertinoIcons.home, label: 'Ana Sayfa'),
              _bottomnavigatorbaritem(
                  icon: CupertinoIcons.profile_circled, label: 'Profil'),
              _bottomnavigatorbaritem(
                  icon: CupertinoIcons.add, label: 'Gönderi'),
              _bottomnavigatorbaritem(
                  icon: CupertinoIcons.settings, label: 'Ayarlar'),
            ]),
      );
    });
  }

  _bottomnavigatorbaritem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
