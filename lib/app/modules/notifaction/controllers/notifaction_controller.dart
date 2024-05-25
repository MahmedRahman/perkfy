import 'package:get/get.dart';
import 'package:perkfy/shared/service.auth.dart';
import 'package:perkfy/web_serives/exception.dart';
import 'package:perkfy/web_serives/model/api_response_model.dart';
import 'package:perkfy/web_serives/web_services.dart';

class NotifactionController extends GetxController with StateMixin {
  @override
  void onInit() {
    getNotifaction();
    // TODO: implement onInit
    super.onInit();
  }

  void getNotifaction() async {
    try {
      ResponseModel responseModel = await WebServices().getNotification(
        userId: Get.find<AuthService>().user["id"].toString(),
      );

      print(responseModel.data["data"].toString());

      change(responseModel.data["data"], status: RxStatus.success());
    } on EmptyDataException {
      change(null, status: RxStatus.empty());
    } catch (e) {
      change(e.toString(), status: RxStatus.error());
    }
  }

  void deleteNotifactionById({
    required String id,
  }) async {
    try {
      ResponseModel responseModel = await WebServices().deleteNotificationById(NotifactionId: id);

      print(responseModel.data["data"].toString());

      change(responseModel.data["data"], status: RxStatus.success());
    } on EmptyDataException {
      change(null, status: RxStatus.empty());
    } catch (e) {
      change(e.toString(), status: RxStatus.error());
    }
  }
}
