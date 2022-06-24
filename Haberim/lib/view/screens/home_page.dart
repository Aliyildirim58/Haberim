import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newss_app/controller/profile_page_controller.dart';
import 'package:newss_app/view/screens/card_widget.dart';
import 'package:newss_app/view/screens/category_filter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/home_page_controller.dart';

class Homepage extends StatelessWidget {
  HomepageController homepageController = Get.put(HomepageController());

  var snackBars;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!homepageController.isLoaded) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              build_title('En Çok Tıklanan Haberler'),
              const SizedBox(
                height: 7,
              ),
              build_carouselslider(),
              build_title('Güncel Haberler'),
              const SizedBox(
                height: 3,
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                  height: 20,
                  margin: const EdgeInsets.all(3),
                  child: Categoryfilter()),
              Expanded(
                  child: CardWidget(
                posts: homepageController.posts,
              )),
            ],
          ),
        ),
      );
    });
  }

  build_carouselslider() {
    return CarouselSlider(
        items: homepageController.img_url
            .map((e) => ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.network(
                        e,
                        height: 350,
                        width: 1050,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 165,
                        child: Container(
                          width: 1050,
                          height: 38,
                          color: Colors.black54,
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.bottomLeft,
                          child: Text('Haberlerin Kısa Başlık Alanları',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          autoPlay: true,
        ));
  } //carousel slider

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
  } //ilk üst başlık

}
