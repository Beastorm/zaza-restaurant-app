import 'package:get/get.dart';

class PickUpOrDeliveryController extends GetxController {
  var isPickUpSelected = false.obs;
  var isDeliverySelected = false.obs;
  var bottomTxt = "".obs;

  togglePickSelection(bool selection) {
    print(selection);
    isPickUpSelected.value = !selection;
    if (isDeliverySelected.value) {
      isDeliverySelected(false);
    }
    bottomTxt.value = "Go For Payment";
    update();
  }

  toggleDeliverySelection(bool selection) {
    isDeliverySelected.value = !selection;
    if (isPickUpSelected.value) {
      isPickUpSelected(false);
    }
    bottomTxt.value = "Next";
    update();
  }
}
