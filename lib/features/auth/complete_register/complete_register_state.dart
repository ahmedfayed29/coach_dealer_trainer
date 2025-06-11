import 'package:coach/core/networking/responses/sports/sports_model.dart';
import 'package:get/get.dart';

import '../../../art_core/art_core.dart';
import '../../../core/networking/network_state_enum.dart';
import '../../../core/networking/responses/countries/country_model.dart';

class CompleteRegisterState {
  late RxString phone;
  late RxString errorPhone;
  late RxString bio;
  late RxString name;
  late RxString errorName;
  late RxString traineeNumbers;
  late RxString sessionNumbers;
  late RxString experienceYears;
  late RxList<ExperienceInListModel> experiences;
  late RxString classPeriod;
  late RxList<ShiftPeriodModel> periodShift;
  late RxList<String> gallery;
  late RxString image;
  late Rx<NetworkState> countriesNetworkState;
  late Rx<CountryModel> country;
  late Rx<NetworkState> networkState;
  late Rx<List<CountryModel>> countries;
  late Rx<List<SportsModel>> sports;
  late Rx<List<WeekDays>> weekDays;
  late Rx<List<WeekDays>> selectedWeekDays;
  final TextEditingController weekDaysController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CompleteRegisterState() {
    country = CountryModel().obs;
    phone = ''.obs;
    name = ''.obs;
    errorName = ''.obs;
    bio = ''.obs;
    traineeNumbers = ''.obs;
    sessionNumbers = ''.obs;
    experienceYears = ''.obs;
    experiences = RxList<ExperienceInListModel>([
      ExperienceInListModel(
        sport: ''.obs,
        sessionFee: ''.obs,
      )
    ]);
    classPeriod = ''.obs;
    periodShift = RxList<ShiftPeriodModel>([
      ShiftPeriodModel(
          from: ''.obs,
          to: ''.obs,
          fromController: TextEditingController(),
          toController: TextEditingController())
    ]);
    gallery = RxList<String>([]);
    image = ''.obs;
    errorName = ''.obs;
    errorPhone = ''.obs;
    countriesNetworkState = NetworkState.INITIAL.obs;
    countries = Rx<List<CountryModel>>([]);
    networkState = NetworkState.INITIAL.obs;
    sports = Rx<List<SportsModel>>([]);
    weekDays = Rx<List<WeekDays>>([
      WeekDays(dayName: 'sunday'.tr, id: 'sunday'),
      WeekDays(dayName: 'monday'.tr, id: 'monday'),
      WeekDays(dayName: 'tuesday'.tr, id: 'tuesday'),
      WeekDays(dayName: 'wednesday'.tr, id: 'wednesday'),
      WeekDays(dayName: 'thursday'.tr, id: 'thursday'),
      WeekDays(dayName: 'friday'.tr, id: 'friday'),
      WeekDays(dayName: 'saturday'.tr, id: 'saturday'),
    ]);
    selectedWeekDays = Rx<List<WeekDays>>([]);
  }
}

class ExperienceInListModel {
  final RxString sport;
  SportsModel? sportModel;
  final RxString sessionFee;
  TextEditingController controller = TextEditingController();

  ExperienceInListModel({
    required this.sport,
    required this.sessionFee,
    this.sportModel,
  });
}

class ShiftPeriodModel {
  final RxString from;
  final RxString to;
  final TextEditingController fromController, toController;

  ShiftPeriodModel({
    required this.from,
    required this.to,
    required this.fromController,
    required this.toController,
  });
}

class WeekDays {
  final String dayName;
  final String id;

  WeekDays({required this.dayName, required this.id});
}
