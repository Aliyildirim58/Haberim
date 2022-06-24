// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categoryfilter extends StatelessWidget {
  var Listem2 = ['Tümü', 'Spor', 'Siyaset', 'Ekonomi', 'Magazin','Turizm','Eğitim'];
  var snackBars;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Listem2.length, //listenin uzunluğu
        itemBuilder: (BuildContext context, indexim) {
          return Container(
            margin: const EdgeInsets.all(0.5),
            child: FlatButton(
              color: Colors.grey[600],
              onPressed: () {
                snackBars =  SnackBar(
                    content: Text(Listem2[indexim]),
                    duration: Duration(seconds: 1));
                ScaffoldMessenger.of(context).showSnackBar(snackBars);
              },
              child: Text(Listem2[indexim],
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(color: Colors.blueGrey),
              ),
            ),
          );
        });
  }
}
