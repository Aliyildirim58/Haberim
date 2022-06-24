import 'package:get/get.dart';
import 'package:newss_app/model/postmodel.dart';
import 'package:newss_app/services/authservice.dart';

class HomepageController extends GetxController {
  Post post = Post("", "", "", "", "", "", 0, 0, 0, "");
  var _isLoaded = false.obs;
  List<Post> posts = [];

  set isLoaded(value) => _isLoaded.value = value;
  get isLoaded => _isLoaded.value;
  final List<String> img_url = [//Hazır urller istenirse databaseden de çekilebilir.
    'https://im.haberturk.com/2021/11/17/ver1637137165/3255983_810x458.jpg',
    'https://www.marastanhaber.com.tr/d/news/51094.jpg',
    'https://www.haberplanet.com/files/uploads/news/thumb/son-dakika-universiteler-icin-ortak-ders-karari-yok-baskani-duyurdu.jpg',
    'https://i13.haber7.net/haber/haber7/bigmanset/2022/11/cihat_yayici_bogazdan_gecen_abd_gemilerinde_ruslarin_onayi_var_1647374955_2619.jpg'
  ];
  getallpost() async {//Tüm gönderileri çeken fonksiyon
    posts = await AuthService().allpost();
    print(posts);
    isLoaded = true;
  }

  @override
  onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getallpost();
  }
}
