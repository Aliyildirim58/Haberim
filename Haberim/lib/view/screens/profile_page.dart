import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newss_app/controller/profile_page_controller.dart';
import 'package:newss_app/view/screens/card_widget.dart';

class Profilepage extends StatelessWidget {
  Profilepagecontroller profilepagecontroller =
      Get.put(Profilepagecontroller());

  // var name, surname, post_count, total_view, token;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            build_title('Kullanıcı Profili'),
            build_profiletop(),
            buildprofile_title(),
            Divider(
              height: 15,
              color: Colors.white,
            ),
            Expanded(
                child: CardWidget(
              posts: profilepagecontroller.posts,
            )),
          ],
        ),
      ),
    );
  }

  build_avatar() {
    //kullanıcı avatarı
    return Avatar(
      margin: EdgeInsets.only(right: 15),
      name: profilepagecontroller.names,
      // sources: [GitHubSource('Aliyildirim58')],
      placeholderColors: [
        Color.fromARGB(255, 33, 32, 34),
      ],
      border: Border.all(color: Colors.transparent),
      elevation: 8,
      shadowColor: Color.fromARGB(255, 11, 14, 17),
      shape: AvatarShape.circle(50),
      useCache: true,
    );
  }

  build_statistics(IconData icon, int post_count) {
    //kullanıcı post verileri
    return Container(
        margin: EdgeInsets.all(5),
        height: 75,
        width: 95,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 11, 14, 17)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              post_count.toString(),
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
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

  build_profiletop() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      child: Row(
        children: [
          build_avatar(),
          Flexible(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 200, //genişlik ve yükseklik ayarlanacak responsive
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 11, 14, 17),
                  ),
                  child: Text(
                    profilepagecontroller.names,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    build_statistics(Icons.remove_red_eye_outlined,
                        profilepagecontroller.user.post_count),
                    build_statistics(Icons.border_color_outlined,
                        profilepagecontroller.user.total_view),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildprofile_title() {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(left: 10, top: 5),
      padding: const EdgeInsets.all(8),
      child: Text(
        'Kullanıcı Haberleri',
        style: GoogleFonts.oswald(
          textStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      alignment: Alignment.center,
    );
  }
}
