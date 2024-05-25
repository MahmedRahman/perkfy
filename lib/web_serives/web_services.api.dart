import 'package:perkfy/web_serives/api_manger.dart';
import 'package:perkfy/web_serives/web_services.url.dart';

import 'model/api_response_model.dart';

class WebServices {
  WebServices();

  // #=========================================================
  //Auth
  // #=========================================================
  Future<ResponseModel> loginWithPhone({
    required String email,
    required String password,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}User/Login",
      HTTPRequestMethod: HTTPRequestEnum.POST,
      query: {
        "email": "$email",
        "password": "$password",
        "DeviceToken": "DeviceToken",
        "brandId": 1,
      },
    );
  }

  Future<ResponseModel> getNotification({
    required String userId,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}UserNotification/GetPaged?pageId=0&pageSize=10&userId=$userId&statusId=1",
      HTTPRequestMethod: HTTPRequestEnum.GET,
      isAuth: true,
    );
  }

  Future<ResponseModel> getStore() async {
    return await ApiManger().execute(
      url: "${API.url}Store/Get",
      HTTPRequestMethod: HTTPRequestEnum.GET,
      isAuth: true,
    );
  }

  Future<ResponseModel> getRewardById({
    required String rewardId,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}RewardSetting/GetById?Id=$rewardId",
      HTTPRequestMethod: HTTPRequestEnum.GET,
      isAuth: true,
    );
  }

  Future<ResponseModel> getRewards() async {
    return await ApiManger().execute(
      url: "${API.url}RewardSetting/GetPaged?statusId=1&brandId=1",
      HTTPRequestMethod: HTTPRequestEnum.GET,
      isAuth: true,
    );
  }

  Future<ResponseModel> getuserInfoById({required String id}) async {
    return await ApiManger().execute(
      url: "${API.url}User/GetById?id=$id",
      HTTPRequestMethod: HTTPRequestEnum.GET,
      isAuth: true,
    );
  }

  Future<ResponseModel> getCups() async {
    return await ApiManger().execute(
      url:
          "${API.url}PunchCardSetting/GetPaged?pageId=0&pageSize=10&searchPattern&sortColumn=Id&sortDirection=0&statusId=1&brandId=1",
      HTTPRequestMethod: HTTPRequestEnum.GET,
      isAuth: true,
    );
  }

  //

  Future<ResponseModel> getQoute() async {
    return await ApiManger().execute(
      url: "${API.url}Qoute/GetCurrent?Id=1",
      HTTPRequestMethod: HTTPRequestEnum.GET,
      isAuth: true,
    );
  }

  Future<ResponseModel> signUp({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String birthday,
    required String sendEmail,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}User/Add",
      HTTPRequestMethod: HTTPRequestEnum.POST,
      query: {
        "id": "1234",
        "firstName": "$name",
        "lastName": "",
        "birthday": (birthday.toString() == "") ? null : birthday.toString(),
        "statusId": 1,
        "brandId": 1,
        "email": "$email",
        "phoneNumber": "$phoneNumber",
        "password": "$password",
        "sendEmail": bool.parse(sendEmail),
        "role": "Member"
      },
      isAuth: true,
    );
  }

//$birthday
  Future<ResponseModel> getHistory({
    required String userId,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}Transaction/GetByUserId?userId=$userId",
      HTTPRequestMethod: HTTPRequestEnum.GET,
      // isAuth: true,
    );
  }

  //'

  Future<ResponseModel> getPrivacyStatement() async {
    return await ApiManger().execute(
      url: "${API.url}PrivacyStatementController/GetByBrand?id=1",
      HTTPRequestMethod: HTTPRequestEnum.GET,
      isAuth: true,
    );
  }

  Future<ResponseModel> deleteNotificationById({
    required String NotifactionId,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}UserNotification/Delete?id=${NotifactionId}",
      HTTPRequestMethod: HTTPRequestEnum.delete,
      isAuth: true,
    );
  }

  Future<ResponseModel> deleteALLNotification({
    required String id,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}UserNotification/DeleteByUser?id=$id",
      HTTPRequestMethod: HTTPRequestEnum.delete,
      isAuth: true,
    );
  }

  Future<ResponseModel> forgotPasswordConfirmation({
    required String phoneNumber,
    required String newPassword,
    required String otp,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}User/ForgotPasswordConfirmation",
      HTTPRequestMethod: HTTPRequestEnum.POST,
      isAuth: true,
      query: {
        "phoneNumber": "$phoneNumber",
        "newPassword": "$newPassword",
        "otp": "$otp",
      },
    );
  }

  Future<ResponseModel> forgotPassword({required String phoneNumber}) async {
    return await ApiManger().execute(
      url: "${API.url}User/ForgotPassword",
      HTTPRequestMethod: HTTPRequestEnum.POST,
      isAuth: true,
      query: {
        "email": "$phoneNumber",
      },
    );
  }

  Future<ResponseModel> getPointSetting() async {
    return await ApiManger().execute(
      url: "${API.url}PointSetting/GetByBrand?id=1",
      HTTPRequestMethod: HTTPRequestEnum.GET,
      isAuth: true,
    );
  }

  Future<ResponseModel> addDycrypted({
    required String encryptedString,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}Transaction/AddDycrypted",
      HTTPRequestMethod: HTTPRequestEnum.POST,
      isAuth: true,
      query: {
        "encryptedString": "$encryptedString",
      },
    );
  }
}
