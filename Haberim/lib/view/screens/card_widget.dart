import 'package:flutter/material.dart';
import 'package:newss_app/controller/profile_page_controller.dart';
import 'package:newss_app/view/screens/card_details.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../model/postmodel.dart';

class CardWidget extends StatelessWidget {
  List<Post> posts;
  CardWidget({required this.posts});
  Profilepagecontroller profilepagecontroller = Get.find();

  var snackBars;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: posts.length,
        itemBuilder: (BuildContext context, sira) {
          return InkWell(
            onTap: () => {
              snackBars = const SnackBar(
                content: Text('Haber Detayına Yönlendiriliyorsunuz'),
                duration: Duration(seconds: 1),
              ),
              ScaffoldMessenger.of(context).showSnackBar(snackBars),
              Get.to(() => Carddetails(
                    post: posts[sira],
                  ))
            },
            child: Card(
              child: Stack(
                children: [
                  Image.network(
                    "https://newssapps.herokuapp.com/${posts[sira].img}",
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.fromLTRB(1, 1, 1, 10),
                    child: Text(
                      posts[sira].title,
                      style: GoogleFonts.oswald(
                        textStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  build_votebar(context),
                ],
              ),
            ),
          );
        });
  }
}

build_votebar(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      LinearPercentIndicator(
        animation: true,
        animationDuration: 1000,
        width: MediaQuery.of(context).size.width / 2.1,
        lineHeight: 8.5,
        backgroundColor: Colors.white,
        progressColor: Colors.lightGreen,
        percent: 0.6,
        center: Text(
          "%58",
          style: TextStyle(color: Colors.black, height: 1, fontSize: 10),
        ),
      ),
    ],
  );
}
