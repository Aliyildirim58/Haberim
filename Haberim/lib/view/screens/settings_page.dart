import 'package:flutter/material.dart';

class Settingspage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _settingsmember('Ali'),
      ],
    );
  }
//about çıkış dil tema gizllik politakası kullanıcı anlaşması versiyon 
}

_settingsmember(String name){
  return Text('ali');
}