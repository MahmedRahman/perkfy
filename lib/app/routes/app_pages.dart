import 'package:get/get.dart';

import '../../middleware.dart';
import '../modules/changePassword/bindings/change_password_binding.dart';
import '../modules/changePassword/views/change_password_view.dart';
import '../modules/contactUs/bindings/contact_us_binding.dart';
import '../modules/contactUs/views/contact_us_view.dart';
import '../modules/cup_detailes/bindings/cup_detailes_binding.dart';
import '../modules/cup_detailes/views/cup_detailes_view.dart';
import '../modules/deleteAccount/bindings/delete_account_binding.dart';
import '../modules/deleteAccount/views/delete_account_view.dart';
import '../modules/forgetpassword/bindings/forgetpassword_binding.dart';
import '../modules/forgetpassword/views/forgetpassword_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/newpassword/bindings/newpassword_binding.dart';
import '../modules/newpassword/views/newpassword_view.dart';
import '../modules/notifaction/bindings/notifaction_binding.dart';
import '../modules/notifaction/views/notifaction_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/otpcode/bindings/otpcode_binding.dart';
import '../modules/otpcode/views/otpcode_view.dart';
import '../modules/personalInfo/bindings/personal_info_binding.dart';
import '../modules/personalInfo/views/personal_info_view.dart';
import '../modules/privacyStatement/bindings/privacy_statement_binding.dart';
import '../modules/privacyStatement/views/privacy_statement_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/qr_scan/bindings/qr_scan_binding.dart';
import '../modules/qr_scan/views/qr_scan_view.dart';
import '../modules/resetpassword/bindings/resetpassword_binding.dart';
import '../modules/resetpassword/views/resetpassword_view.dart';
import '../modules/rewards/bindings/rewards_binding.dart';
import '../modules/rewards/views/rewards_view.dart';
import '../modules/rewards_claim/bindings/rewards_claim_binding.dart';
import '../modules/rewards_claim/views/rewards_claim_view.dart';
import '../modules/rewards_detail/bindings/rewards_detail_binding.dart';
import '../modules/rewards_detail/views/rewards_detail_view.dart';
import '../modules/scan/bindings/scan_binding.dart';
import '../modules/scan/views/scan_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/stores/bindings/stores_binding.dart';
import '../modules/stores/views/stores_view.dart';
import '../modules/termsOfUse/bindings/terms_of_use_binding.dart';
import '../modules/termsOfUse/views/terms_of_use_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      middlewares: [
        GlobalMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.FORGETPASSWORD,
      page: () => ForgetpasswordView(),
      binding: ForgetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.OTPCODE,
      page: () => OtpcodeView(),
      binding: OtpcodeBinding(),
    ),
    GetPage(
      name: _Paths.RESETPASSWORD,
      page: () => const ResetpasswordView(),
      binding: ResetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.NEWPASSWORD,
      page: () => const NewpasswordView(),
      binding: NewpasswordBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_INFO,
      page: () => PersonalInfoView(),
      binding: PersonalInfoBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_US,
      page: () => ContactUsView(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_OF_USE,
      page: () => const TermsOfUseView(),
      binding: TermsOfUseBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_STATEMENT,
      page: () => const PrivacyStatementView(),
      binding: PrivacyStatementBinding(),
    ),
    GetPage(
      name: _Paths.DELETE_ACCOUNT,
      page: () => const DeleteAccountView(),
      binding: DeleteAccountBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => const ScanView(),
      binding: ScanBinding(),
      middlewares: [
        GlobalMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.REWARDS,
      page: () => const RewardsView(),
      binding: RewardsBinding(),
      middlewares: [
        GlobalMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.STORES,
      page: () => const StoresView(),
      binding: StoresBinding(),
      middlewares: [
        GlobalMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.NOTIFACTION,
      page: () => NotifactionView(),
      binding: NotifactionBinding(),
    ),
    GetPage(
      name: _Paths.REWARDS_DETAIL,
      page: () => const RewardsDetailView(),
      binding: RewardsDetailBinding(),
    ),
    GetPage(
      name: _Paths.REWARDS_CLAIM,
      page: () => const RewardsClaimView(),
      binding: RewardsClaimBinding(),
    ),
    GetPage(
      name: _Paths.QR_SCAN,
      page: () => QRScannerScreen(),
      binding: QrScanBinding(),
    ),
    GetPage(
      name: _Paths.CUP_DETAILES,
      page: () => const CupDetailesView(),
      binding: CupDetailesBinding(),
    ),
  ];
}
