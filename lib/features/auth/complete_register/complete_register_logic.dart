import 'dart:io';

import 'package:coach/core/networking/responses/sports/sports_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../art_core/art_core.dart';
import '../../../core/networking/dot/complete_profile.dart';
import '../../../core/networking/network_state_enum.dart';
import '../../../core/networking/repository/auth/auth_repository.dart';
import '../../../core/networking/responses/countries/country_model.dart';
import '../../../core/routes/app_pages.dart';
import '../../../core/utils/pick_image_util.dart';
import 'complete_register_state.dart';

class CompleteRegisterLogic extends GetxController {
  final AuthRepository authRepository;
  final CompleteRegisterState state = CompleteRegisterState();

  CompleteRegisterLogic(this.authRepository);

  @override
  Future<void> onInit() async {
    await Future.wait([
      getCountries(),
      getSports(),
    ]);
    super.onInit();
  }

  void getProfile() async {
    try {
      state.networkState.value = NetworkState.LOADING;
      final response = await authRepository.getProfile();
      if (response.isRequestSuccess) {
        state.country.value = response.body.data!.country;
        state.phone.value = response.body.data!.phone ?? "";
        state.name.value = response.body.data!.name ?? "";
        state.bio.value = "${response.body.data!.bio ?? ""}";
        state.traineeNumbers.value = (response.body.data!.traineesNumber ?? "").toString();
        state.sessionNumbers.value = (response.body.data!.sessionsNumber ?? "").toString() ?? "";
        state.experienceYears.value = (response.body.data!.experienceYears ?? "").toString() ?? "";
        state.experiences.clear();
        state.periodShift.clear();
        if (response.body.data!.sports.isEmpty) {
          state.experiences.add(ExperienceInListModel(
            sport: ''.obs,
            sessionFee: ''.obs,
          ));
        }
        for (var sport in response.body.data!.sports) {
          state.experiences.add(ExperienceInListModel(
            sport: sport.id.toString().obs,
            sessionFee: sport.price.obs,
            sportModel: SportsModel(
              id: sport.id,
              name: sport.name,
            ),
          ));
          print("name is ${sport.name}");
          state.experiences.last.controller.text = sport.name;
        }
        if (response.body.data!.shifts.isEmpty) {
          state.periodShift.add(ShiftPeriodModel(
            from: ''.obs,
            to: ''.obs,
            fromController: TextEditingController(),
            toController: TextEditingController(),
          ));
        }
        for (var shift in response.body.data!.shifts) {
          state.periodShift.add(
            ShiftPeriodModel(
              from: shift.startTime.toString().obs,
              to: shift.endTime.toString().obs,
              fromController: TextEditingController(text: shift.startTime.toString()),
              toController: TextEditingController(text: shift.endTime.toString()),
            ),
          );
        }
        for (var image in response.body.data!.images) {
          state.gallery.add(image.url);
        }
        for (var day in response.body.data!.workingDays) {
          state.selectedWeekDays.value.add(
            WeekDays(
              dayName: day.day,
              id: day.day,
            ),
          );
          state.weekDaysController.text =
              state.selectedWeekDays.value.map((day) => day.dayName).join(', ');
        }
        state.classPeriod.value = response.body.data!.classPeriod.toString();
        state.image.value = response.body.data!.image;
        state.networkState.value = NetworkState.SUCCESS;
      } else {
        state.networkState.value = NetworkState.ERROR;
      }
    } catch (e, s) {
      print("e is $e $s");
      state.networkState.value = NetworkState.ERROR;
    }
  }

  Future<void> getCountries() async {
    state.countriesNetworkState.value = NetworkState.LOADING;
    final response = await authRepository.countries();
    if (response.isRequestSuccess) {
      state.countriesNetworkState.value = NetworkState.SUCCESS;
      state.countries.value = response.body.data ?? [];
      state.country.value = response.body.data!.first;
    } else {
      state.countriesNetworkState.value = NetworkState.ERROR;
      showCustomSnackBar(response.errorMessage, isError: true);
    }
  }

  Future<void> getSports() async {
    state.countriesNetworkState.value = NetworkState.LOADING;
    final response = await authRepository.sports();
    if (response.isRequestSuccess) {
      state.countriesNetworkState.value = NetworkState.SUCCESS;
      state.sports.value = response.body.data;
    } else {
      state.countriesNetworkState.value = NetworkState.ERROR;
      showCustomSnackBar(response.errorMessage, isError: true);
    }
  }

  void addWeekDay({required int index}) {
    if (state.selectedWeekDays.value
        .any((day) => day.dayName == state.weekDays.value[index].dayName)) {
      state.selectedWeekDays.value
          .removeWhere((day) => day.dayName == state.weekDays.value[index].dayName);
      state.weekDaysController.text =
          state.selectedWeekDays.value.map((day) => day.dayName).join(', ');
      return;
    }
    state.selectedWeekDays.value.add(state.weekDays.value[index]);
    state.weekDaysController.text =
        state.selectedWeekDays.value.map((day) => day.dayName).join(', ');
  }

  void updatePhone(String phone) {
    state.phone.value = phone;
  }

  void updateProfile(File image) {
    state.image.value = image.path;
  }

  void updateName(String name) {
    state.name.value = name;
  }

  void updateBio(String bio) {
    state.bio.value = bio;
  }

  void updateClassPeriod(String clasPeriod) {
    state.classPeriod.value = clasPeriod;
  }

  Future<void> updateImage() async {
    final newImage = await PickImageUtil.pickImage(source: ImageSource.gallery);
    if (newImage != null) {
      state.image.value = newImage.path;
    }
  }

  void updateExperienceYears(String years) {
    state.experienceYears.value = years;
  }

  void updateTraineeNumbers(String numbers) {
    state.traineeNumbers.value = numbers;
  }

  void updateSessionNumbers(String numbers) {
    state.sessionNumbers.value = numbers;
  }

  void updateCountry(CountryModel country) {
    state.country.value = country;
  }

  void updateExperienceSport({required int selectedIndex, required int position}) {
    state.experiences[position].sport.value = state.sports.value[selectedIndex].name.toString();
    state.experiences[position].sportModel = state.sports.value[selectedIndex];
    state.experiences[position].controller.text = state.sports.value[selectedIndex].name.toString();
  }

  void updateExperienceSportFee({required int position, required String value}) {
    state.experiences[position].sessionFee.value = value;
  }

  void addExperience() {
    state.experiences.add(ExperienceInListModel(
      sport: ''.obs,
      sessionFee: ''.obs,
    ));
  }

  void removeExperience({required int index}) {
    state.experiences.removeAt(index);
  }

  void addNewPeriodShift() {
    state.periodShift.add(ShiftPeriodModel(
      from: ''.obs,
      to: ''.obs,
      fromController: TextEditingController(),
      toController: TextEditingController(),
    ));
  }

  void removePeriodShift({required int index}) {
    state.periodShift.removeAt(index);
  }

  Future<void> addGalleryImage() async {
    final pickedImage = await PickImageUtil.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) state.gallery.add(pickedImage.path);
  }

  void removeGalleryImage(int index) {
    state.gallery.removeAt(index);
  }

  Future<void> completeProfile({
    required String countryCode,
    required String phone,
    required bool isEdit,
  }) async {
    if (state.formKey.currentState!.validate()) {
      final body = CompleteProfileModel(
        gallery: state.gallery.map((image) => File(image)).toList(),
        image: File(state.image.value),
        name: state.name.value,
        phone: phone.replaceAll("966", ""),
        countryCode: countryCode,
        traineesNumber: state.traineeNumbers.value,
        sessionsNumber: state.sessionNumbers.value,
        experienceYears: state.experienceYears.value,
        bio: state.bio.value,
        classPeriod: state.classPeriod.value,
        workingDays: state.selectedWeekDays.value,
        shifts: state.periodShift
            .map((shift) => ShiftModel(
                  startTime: shift.from.value,
                  endTime: shift.to.value,
                ))
            .toList(),
        sports: state.experiences
            .map((exp) => SportModel(
                  id: exp.sportModel!.id!,
                  price: exp.sessionFee.value,
                ))
            .toList(),
      );
      final res = await authRepository.completeProfile(updateProfileModel: body);
      if (res.isRequestSuccess) {
        state.networkState.value = NetworkState.SUCCESS;
        Get.offAllNamed(Routes.HOME);
        // Get.offAllNamed(isEdit ? Routes.HOME : Routes.LOGIN);
      } else {
        state.networkState.value = NetworkState.ERROR;
        showCustomSnackBar(res.errorMessage, isError: true);
      }
    }
  }
}
