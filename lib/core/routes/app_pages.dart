import 'package:coach/features/account/static_content/static_content_binding.dart';
import 'package:coach/features/account/static_content/static_content_page.dart';
import 'package:coach/features/auth/complete_register/complete_register_view.dart';
import 'package:coach/features/auth/otp/otp_binding.dart';
import 'package:coach/features/auth/otp/otp_page.dart';
import 'package:coach/features/auth/profile/profile_page.dart';
import 'package:coach/features/choose_lang/choose_lang_page.dart';
import 'package:coach/features/coaches/coach_details/coach_details_binding.dart';
import 'package:coach/features/coaches/coach_details/coach_details_page.dart';
import 'package:coach/features/home/home_binding.dart';
import 'package:coach/features/home/home_page.dart';
import 'package:coach/features/notifications/notifications_binding.dart';
import 'package:coach/features/notifications/notifications_page.dart';
import 'package:get/get.dart';

import '../../features/account/account_page/account_binding.dart';
import '../../features/account/account_page/account_page.dart';
import '../../features/account/addresses/add_address/add_address_binding.dart';
import '../../features/account/addresses/add_address/add_address_page.dart';
import '../../features/account/addresses/edit_address/edit_address_binding.dart';
import '../../features/account/addresses/edit_address/edit_address_page.dart';
import '../../features/account/addresses/my_addresses/my_addresses_binding.dart';
import '../../features/account/addresses/my_addresses/my_addresses_page.dart';
import '../../features/account/contact_us/contact_us_binding.dart';
import '../../features/account/contact_us/contact_us_page.dart';
import '../../features/account/settings/settings_binding.dart';
import '../../features/account/settings/settings_page.dart';
import '../../features/auth/complete_register/complete_register_binding.dart';
import '../../features/auth/login/login_binding.dart';
import '../../features/auth/login/login_page.dart';
import '../../features/auth/profile/profile_binding.dart';
import '../../features/auth/register/register_binding.dart';
import '../../features/auth/register/register_page.dart';
import '../../features/coaches/book_class/book_class_binding.dart';
import '../../features/coaches/book_class/book_class_page.dart';
import '../../features/splash/splash_binding.dart';
import '../../features/splash/splash_page.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
      transition: Transition.native,
      // children: [],
    ),
    GetPage(
      name: Routes.CHOOSE_LANG,
      page: () => const ChooseLangPage(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.OTP,
      page: () => OTPPage(
        phoneNumber: Get.arguments[0],
        countryCode: Get.arguments[1],
        isRegister: Get.arguments[2] ?? false,
      ),
      binding: OTPBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.COMPLETE_REGISTER,
      page: () => CompleteRegisterPage(
        phone: Get.arguments[0],
        countryCode: Get.arguments[1],
      ),
      binding: CompleteRegisterBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.ACCOUNT,
      page: () => AccountPage(),
      binding: AccountBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.CONTACT_US,
      page: () => ContactUsPage(),
      binding: ContactUsBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsPage(),
      binding: SettingsBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.STATIC_CONTENT,
      page: () => StaticContentPage(title: Get.arguments),
      binding: StaticContentBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.NOTIFICATIONS,
      page: () => const NotificationsPage(),
      binding: NotificationsBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.MY_ADDRESSES,
      page: () => const MyAddressesPage(),
      binding: MyAddressesBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.ADD_ADDRESS,
      page: () => const AddAddressPage(),
      binding: AddAddressBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.EDIT_ADDRESS,
      page: () => const EditAddressPage(),
      binding: EditAddressBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.COACH_DETAILS,
      page: () => const CoachDetailsPage(),
      binding: CoachDetailsBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.BOOK_CLASS,
      page: () => const BookClassPage(),
      binding: BookClassBinding(),
      transition: Transition.native,
    ),
  ];
}
