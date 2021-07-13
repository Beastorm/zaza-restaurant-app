import 'package:get/get.dart';
import 'package:zaza/repo/app_info_repo.dart';

class AppInfoController extends GetxController {
  var privacyPolicy = "".obs;
  var restaurantEmail = "".obs;
  var restaurantMobileNo = "".obs;

  @override
  void onInit() {
    requestForAppInfo();
    super.onInit();
  }

  requestForAppInfo() async {
    var data = await getAppInfo();
    privacyPolicy.value = data.termsAndConditions;
    restaurantEmail.value = data.contactEmail;
    restaurantMobileNo.value = data.contactMobile;
    update();
  }
}
