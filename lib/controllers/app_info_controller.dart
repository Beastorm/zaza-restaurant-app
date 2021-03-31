import 'package:get/get.dart';
import 'package:zaza/repo/app_info_repo.dart';

class AppInfoController extends GetxController {
  var privacyPolicy = "".obs;

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    requestForAppInfo();
    super.onInit();
  }

  requestForAppInfo() async {
    var data = await getAppInfo();
    privacyPolicy.value = data.privacyPolicy;
    update();
  }
}
