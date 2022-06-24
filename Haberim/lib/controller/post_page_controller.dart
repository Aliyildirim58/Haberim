import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newss_app/controller/loginpage_controller.dart';
import 'package:newss_app/controller/profile_page_controller.dart';
import 'package:newss_app/services/authservice.dart';
import 'package:newss_app/view/screens/flow_page.dart';

class Postpagecontroller extends GetxController {
  var useremail = Get.find<Loginpagecontroller>().email;
  Profilepagecontroller profilepagecontroller = Get.find();
  TextEditingController controller_title = TextEditingController();
  TextEditingController controller_content = TextEditingController();
  RxString _selected_il = "Ankara".obs;
  RxString _selected_kategory = "Spor".obs;
  File image = File('');

  set selected_il(value) => _selected_il.value = value;
  set selected_kategory(value) => _selected_kategory.value = value;

  get selected_il => _selected_il.value;
  get selected_kategory => _selected_kategory.value;

  postupload() async {// gönderi yükleme fonksiyonu
    await AuthService()
        .addpost(controller_title.value.text, controller_content.value.text,
            selected_il, selected_kategory, image, useremail)
        .then((value) {
      if (value) {
        Get.snackbar(
            'Gönderi İşlemi Başarılı', 'İşleminize Devam Edebilirsiniz',
            duration: Duration(seconds: 2));
        profilepagecontroller.getProfilepost();
      } else {
        Get.snackbar('Gönderi Yükleme ', 'Başarısız');
      }
    });
  }
  List<String> sehirler = [//haber şehir listesi
    "Adana",
    "Adıyaman",
    "Afyon",
    "Ağrı",
    "Amasya",
    "Ankara",
    "Antalya",
    "Artvin",
    "Aydın",
    "Balıkesir",
    "Bilecik",
    "Bingöl",
    "Bitlis",
    "Bolu",
    "Burdur",
    "Bursa",
    "Çanakkale",
    "Çankırı",
    "Çorum",
    "Denizli",
    "Diyarbakır",
    "Edirne",
    "Elazığ",
    "Erzincan",
    "Erzurum",
    "Eskişehir",
    "Gaziantep",
    "Giresun",
    "Gümüşhane",
    "Hakkari",
    "Hatay",
    "Isparta",
    "İçel (Mersin)",
    "İstanbul",
    "İzmir",
    "Kars",
    "Kastamonu",
    "Kayseri",
    "Kırklareli",
    "Kırşehir",
    "Kocaeli",
    "Konya",
    "Kütahya",
    "Malatya",
    "Manisa",
    "Kahramanmaraş",
    "Mardin",
    "Muğla",
    "Muş",
    "Nevşehir",
    "Niğde",
    "Ordu",
    "Rize",
    "Sakarya",
    "Samsun",
    "Siirt",
    "Sinop",
    "Sivas",
    "Tekirdağ",
    "Tokat",
    "Trabzon",
    "Tunceli",
    "Şanlıurfa",
    "Uşak",
    "Van",
    "Yozgat",
    "Zonguldak",
    "Aksaray",
    "Bayburt",
    "Karaman",
    "Kırıkkale",
    "Batman",
    "Şırnak",
    "Bartın",
    "Ardahan",
    "Iğdır",
    "Yalova",
    "Karabük",
    "Kilis",
    "Osmaniye",
    "Düzce"
  ];
  List<String> kategori = [//haber kategori listesi
    "Spor",
    "Siyaset",
    "Ekonomi",
    "Magazin",
    "Turizm",
    "Eğitim"
  ];
}
