import 'package:get/get.dart';
import 'package:perkfy/shared/service.auth.dart';
import 'package:perkfy/web_serives/exception.dart';
import 'package:perkfy/web_serives/model/api_response_model.dart';
import 'package:perkfy/web_serives/web_services.api.dart';
import 'package:url_launcher/url_launcher.dart';

class StoresController extends GetxController with StateMixin {
  @override
  void onInit() {
    getStores();
    super.onInit();
  }

  void getStores() async {
    try {
      ResponseModel responseModel = await WebServices().getStore();

      print(responseModel.data["data"].toString());

      change(responseModel.data["data"], status: RxStatus.success());
    } on EmptyDataException {
      change(null, status: RxStatus.empty());
    } catch (e) {
      change(e.toString(), status: RxStatus.error());
    }
  }

  void openMap(String latitude, String longitude) async {}
}
