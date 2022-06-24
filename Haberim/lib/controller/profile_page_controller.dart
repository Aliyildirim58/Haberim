import 'package:get/get.dart';
import 'package:newss_app/model/postmodel.dart';
import 'package:newss_app/model/usermodel.dart';
import '../services/authservice.dart';
import 'loginpage_controller.dart';

class Profilepagecontroller extends GetxController {
  final List<String> img_url = [
    'https://im.haberturk.com/2021/11/17/ver1637137165/3255983_810x458.jpg',
    'https://www.marastanhaber.com.tr/d/news/51094.jpg',
    'https://www.haberplanet.com/files/uploads/news/thumb/son-dakika-universiteler-icin-ortak-ders-karari-yok-baskani-duyurdu.jpg',
    'https://i13.haber7.net/haber/haber7/bigmanset/2022/11/cihat_yayici_bogazdan_gecen_abd_gemilerinde_ruslarin_onayi_var_1647374955_2619.jpg'
  ];
  User user = User("", "", "", "", 0, 0);
  Post post = Post("", "", "", "", "", "", 0, 0, 0, "");
  List<Post> posts = [];
  final Loginpagecontroller loginpagecontroller = Get.find();
  String names = "";
  Future<User> getUserinfo() async {//kullanıcı isim soysim bilgilerini çeker
    return await AuthService().profileuser(loginpagecontroller.email);
  }

  void getProfilepost() async {//kullanıcının geçmiş haberlerini çeker
    posts = await AuthService().profilepost(loginpagecontroller.email);
    print(posts);
  }

  @override
  void onInit() async {
    super.onInit();
    user = await getUserinfo();
    getProfilepost();
    names = user.name + " " + user.surname;
    //post = await getProfilepost();
  }
}
