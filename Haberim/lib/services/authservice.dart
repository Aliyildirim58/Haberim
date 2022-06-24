import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newss_app/model/postmodel.dart';
import 'package:newss_app/model/usermodel.dart';

import '../model/postmodel.dart';

class AuthService {
  Dio dio = new Dio();

  Future<Response> login(email, password) async {//kullanıcı giriş yaptıktan sonra backend ile haberleşme
    late Response response;
    try {
      response = await dio.post('https://newssapps.herokuapp.com/authenticate',
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    }
    return response;
  }

  Future<bool> addpost(title, detail, city, category, img, useremail) async {//Kullanıcı post yükleme
    bool isSuccess = false;

    FormData formData = FormData.fromMap({
      "post_title": title,
      "post_detail": detail,
      "post_city": city,
      "post_category": category,
      "post_img": await MultipartFile.fromFile(img.path),
      "post_useremail": useremail
    });
    try {
      Response response = await dio.post(
          "https://newssapps.herokuapp.com/addpost",
          data: formData,
          options: Options(
            headers: {
              HttpHeaders.acceptHeader: 'application/json',
              HttpHeaders.contentTypeHeader:
                  'application/x-www-form-urlencoded',
            },
            receiveTimeout: 200000,
            sendTimeout: 200000,
          ));

      isSuccess = true;
    } on DioError catch (e) {
      e;
    }
    return isSuccess;
  }

  Future<Response> adduser(name, surname, email, password) async {//kullanıcı kayıt 
    late Response response;
    try {
      response = await dio.post('https://newssapps.herokuapp.com/adduser',
          data: {
            "name": name,
            "surname": surname,
            "email": email,
            "password": password,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    }
    return response;
  }

  getinfo(token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    return await dio.get('https://newssapps.herokuapp.com/getinfo');
  }

  Future<User> profileuser(email) async {//kullanıcı bilgi
    late User user;
    try {
      Response response = await dio.post(
          'https://newssapps.herokuapp.com/profileuser',
          data: {"email": email},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      user = User.fromJson(response.data["msg"]);
    } on DioError catch (e) {
      e;
    }

    return user;
  }

  Future<List<Post>> profilepost(email) async {//kullanıcı geçmiş haberler
    try {
      List<Post> posts = [];
      Response response = await dio.post(
          'https://newssapps.herokuapp.com/profilepost',
          data: {"post_useremail": email},
          options: Options(contentType: Headers.formUrlEncodedContentType));

      for (var i = 0; i < response.data["msg"].length; i++) {
        posts.add(Post.fromJson(response.data["msg"][i]));
      }

      print("POST LENGTH: " + posts.length.toString());

      return posts;
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<List<Post>> allpost() async {//ana sayfa tüm haberler
    try {
      List<Post> posts = [];
      Response response = await dio.post(
          'https://newssapps.herokuapp.com/allpost',
          options: Options(contentType: Headers.formUrlEncodedContentType));

      for (var i = 0; i < response.data["msg"].length; i++) {
        posts.add(Post.fromJson(response.data["msg"][i]));
      }

      print("POST LENGTH: " + posts.length.toString());

      return posts;
    } on DioError catch (e) {
      throw e;
    }
  }
}
