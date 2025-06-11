import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../theme/app_colors.dart';

Future<DateTime?> datePicker({
  required BuildContext context,
  required TextEditingController dateController,
  DateTime? firstDate,
  DateTime? initDate,
  DateTime? lastDate,
}) async {
  DateTime? newDateTime = await showRoundedDatePicker(
    context: context,
    initialDate: initDate ?? DateTime(1999),
    firstDate: firstDate ?? DateTime(1900),
    styleDatePicker: MaterialRoundedDatePickerStyle(
      backgroundActionBar: AppColors.white,
      backgroundHeader: AppColors.white,
      backgroundHeaderMonth: AppColors.white,
      decorationDateSelected: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryColor.withOpacity(.4),
      ),
      backgroundPicker: AppColors.white,
      colorArrowNext: AppColors.primaryColor,
      textStyleDayOnCalendar: TextStyle(color: AppColors.primaryColor),
      colorArrowPrevious: AppColors.primaryColor,
    ),
    theme: Theme.of(context).copyWith(
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor, // header background color
        onPrimary: AppColors.secondaryColor, // header text color
        onSurface: AppColors.secondaryColor, // body text color
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryColor, // button text color
        ),
      ),
    ),
    textNegativeButton: 'cancel'.tr,
    lastDate: lastDate ?? DateTime.now().subtract(Duration(days: 1460)),
    borderRadius: 16,
  );
  if (newDateTime != null) {
    dateController.text = DateFormat("yyyy-MM-dd", "en").format(newDateTime);
  }
  return newDateTime;
}

Future<TimeOfDay?> timePicker({
  required BuildContext context,
  required TextEditingController timeController,
}) async {
  TimeOfDay? time = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (context, child) {
      return Theme(
        data: ThemeData.light().copyWith(colorScheme: ColorScheme.light()),
        child: child ?? SizedBox(),
      );
    },
  );

  if (time != null) {
    timeController.text = time.format(context);
  }
  return time;
}
