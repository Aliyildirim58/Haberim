import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newss_app/controller/profile_page_controller.dart';

import '../../model/postmodel.dart';

class Carddetails extends StatelessWidget {
  Post post;
  Carddetails({required this.post});

  Profilepagecontroller profilepagecontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 30, 35, 41),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Haber Detayı'),
          backgroundColor: const Color.fromARGB(255, 11, 14, 17),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 11, 14, 17),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              build_texts('Haber Fotoğrafları'),
              build_newssphoto(context),
              build_texts('Haberin Detayları'),
              build_newsstitle(),
              Divider(
                height: 1,
                color: Colors.white,
              ),
              //build_texts('Haber Açıklaması'),
              build_newsscontent(),
              Divider(
                height: 1,
                color: Colors.white,
              ),
              build_citycategory(),
              build_texts('Habere Oyunuz'),
              Row(
                children: [
                  build_newssvote(context),
                  build_newssvote2(context),
                  build_newssvote3(context),
                ],
              )
            ],
          ),
        ));
  }

  build_newssphoto(context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 35,
          horizontal: MediaQuery.of(context).size.width / 15),
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            offset: Offset(5, 5),
          ),
        ],
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage("https://newssapps.herokuapp.com/${post.img}")),
      ),
    );
  }

  build_newsscontent() {
    return Container(
      margin: EdgeInsets.all(7),
      child: Text(
        "${post.detail}",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  build_texts(String titles) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.lightGreen,
        ),
      ),
      margin: EdgeInsets.only(top: 8),
      child: Text(titles,
          style: GoogleFonts.oswald(
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }

  build_newssvote(context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      margin: EdgeInsets.all(6),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.black.withOpacity(0.1)),
        ),
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              Icons.thumb_up,
              color: Colors.greenAccent,
            ),
            SizedBox(
              width: 5,
              height: 1,
            ),
            Text(
              'Like',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  build_newssvote2(context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      margin: EdgeInsets.all(6),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.black.withOpacity(0.1)),
        ),
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              Icons.thumb_down,
              color: Colors.redAccent,
            ),
            SizedBox(
              width: 5,
              height: 1,
            ),
            Text(
              'Dislike',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  build_newssvote3(context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      margin: EdgeInsets.all(6),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              Icons.do_not_disturb_sharp,
              color: Colors.redAccent,
            ),
            SizedBox(
              width: 5,
              height: 1,
            ),
            Text(
              'Şikayet',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  build_newsstitle() {
    return Container(
      margin: EdgeInsets.all(7),
      child: Text(
        "${post.title}",
        style: TextStyle(color: Colors.blue[300], fontWeight: FontWeight.bold),
      ),
    );
  }

  build_citycategory() {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Haber İli: ${post.city}",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          Text(
            "Haber Kategorisi: ${post.category}",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
