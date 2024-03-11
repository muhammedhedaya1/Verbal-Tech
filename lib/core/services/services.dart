import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService{
  late SharedPreferences sharedPreference;
  Future<MyServices> init()async{
    sharedPreference = await SharedPreferences.getInstance();
    return this;
  }

}
initialServices()async{
 await Get.putAsync(() => MyServices().init());
}