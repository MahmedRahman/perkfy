import 'package:get/get.dart';
import 'package:perkfy/web_serives/model/api_response_model.dart';
import 'package:perkfy/web_serives/web_services.api.dart';

RxString KgainPoints = "0".obs;
RxString KgainMoney = "0".obs;

class HomeController extends GetxController {
  @override
  void onInit() async {
    await getSetting();
    // TODO: implement onInit
    super.onInit();
  }

  Future getSetting() async {
    try {
      //  if (KgainPoints == 0 || KgainMoney == 0) {
      ResponseModel responseModel = await WebServices().getPointSetting();
      KgainPoints.value = responseModel.data["data"]["gainPoints"].toString();
      KgainMoney.value = responseModel.data["data"]["gainMoney"].toString();
      //}
    } catch (e) {
      //change(e, status: RxStatus.error());
    }
  }

  //TODO: Implement HomeController
}
