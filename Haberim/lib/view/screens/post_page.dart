import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newss_app/controller/post_page_controller.dart';

class Postpage extends StatefulWidget {
  const Postpage({Key? key}) : super(key: key);

  @override
  _Postpage createState() => _Postpage();
}

class _Postpage extends State<Postpage> {
  final Postpagecontroller postpagecontroller = Get.put(Postpagecontroller());
  final _formKey = GlobalKey<FormState>();
  // File _image = File('');
  final ImagePicker _picker = ImagePicker();
  Future getImagecamera() async {
    final image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 10);
    setState(() {
      postpagecontroller.image = File(image!.path);
    });
  }

  Future getImagegalery() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      postpagecontroller.image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                build_title('Gönderi Oluşturma'),
                const SizedBox(
                  height: 15,
                ),
                build_newsstitle(), //başlık
                const SizedBox(
                  height: 15,
                ),
                build_postcontent(), //içerik
                const SizedBox(
                  height: 15,
                ),
                build_dropdownroot(), //haberili dropdown
                const SizedBox(
                  height: 15,
                ),
                build_dropdowncategory(), //haber kategory dropdown
                const SizedBox(
                  height: 15,
                ),
                build_title('Haber Fotoğrafı'), //haber fotoğraf
                build_imagefile(context),
                build_savebutton(), //kaydet butonu
              ],
            ),
          ),
        ],
      ),
    );
  }

  build_title(String title) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(left: 10, top: 5),
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        style: GoogleFonts.oswald(
          textStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blueAccent,
          )),
      alignment: Alignment.center,
    );
  }

  build_newsstitle() {
    //Başlık alanı
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      controller: postpagecontroller.controller_title,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15, 15, 5, 5),
        labelText: 'Haber Başlığınız',
        labelStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        hintText: 'Haber Başlığını Giriniz',
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  build_postcontent() {
    //İçerik alanı
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      maxLines: 10,
      controller: postpagecontroller.controller_content,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.fromLTRB(15, 15, 5, 5),
        labelText: 'Haber Detayı',
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        hintText: 'Haber İçeriğini Giriniz',
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  build_dropdownlist() {
    return DropdownButton(
      dropdownColor: Colors.black45,
      value: postpagecontroller.selected_il,
      items: postpagecontroller.sehirler.map((selected) {
        return DropdownMenuItem(
          child: Text(
            selected,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          value: selected,
        );
      }).toList(),
      onChanged: (newvalue) {
        setState(() {
          postpagecontroller.selected_il = newvalue.toString();
        });
      },
    );
  }

  build_dropdownlistcategory() {
    return DropdownButton(
      dropdownColor: Colors.black45,
      value: postpagecontroller.selected_kategory,
      items: postpagecontroller.kategori.map((selecteds) {
        return DropdownMenuItem(
          child: Text(
            selecteds,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          value: selecteds,
        );
      }).toList(),
      onChanged: (newvalue) {
        setState(() {
          postpagecontroller.selected_kategory = newvalue.toString();
        });
      },
    );
  }

  build_imagefile(context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 1.1,
          // ignore: unnecessary_null_comparison
          child: postpagecontroller.image.path == ""
              ? Image.network(
                  "https://thumbs.dreamstime.com/b/news-icon-isolated-black-background-simple-vector-logo-news-icon-isolated-black-background-161462124.jpg",
                  fit: BoxFit.contain,
                )
              : Image.file(
                  postpagecontroller.image,
                  fit: BoxFit.contain,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                getImagecamera();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 5,
                    height: 1,
                  ),
                  Text(
                    'Kameradan Yükle',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                getImagegalery();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add_a_photo_rounded,
                    color: Colors.redAccent,
                  ),
                  SizedBox(
                    width: 5,
                    height: 1,
                  ),
                  Text(
                    'Galeriden Yükle',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  build_dropdownroot() {
    //haberili dropdown
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blueAccent,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Haber İlini Seçiniz',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          build_dropdownlist(),
        ],
      ),
    );
  }

  build_dropdowncategory() {
    //haber kategory dropdown
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blueAccent,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Haber Kategorisini Seçiniz',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          build_dropdownlistcategory(),
        ],
      ),
    );
  }

  build_savebutton() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 2,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.black.withOpacity(0.1)),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            postpagecontroller.postupload();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.save,
              color: Colors.greenAccent,
            ),
            SizedBox(
              width: 5,
              height: 1,
            ),
            Text(
              'Kaydet ve Gönder',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
