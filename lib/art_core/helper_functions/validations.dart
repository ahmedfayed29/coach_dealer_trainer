
class ValidationModel {
  final String? message;

  final bool valid;

  ValidationModel({this.message = '', this.valid = false});
}

class ValidationsHelper {
  final String _nameRegExp = r"""
^[0-9]+$""";

  final _emailRegExp = r"""
^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  ValidationModel email(String email, {String? message}) {
    if (!RegExp(_emailRegExp).hasMatch(email)) {
      return ValidationModel(
          message: message ?? "email_validator", valid: false);
    }
    return ValidationModel(
      valid: true,
    );
  }

  ValidationModel phone(String phone, {String? message}) {
    if ((phone.length < 10 || phone.length > 30)) {
      return ValidationModel(
          message: message ?? "phone_validator", valid: false);
    }

    return ValidationModel(
      valid: true,
    );
  }

  ValidationModel nationalId(String nationalId,
      {String? message, int length = 10}) {
    if (nationalId.isNotEmpty && nationalId.length != length) {
      return ValidationModel(
          message: message ?? "national_id_validator", valid: false);
    }

    return ValidationModel(
      valid: true,
    );
  }

  ValidationModel name(String name,
      {String? errorMessage, int min = 3, int max = 30}) {
    if (name.length < min ||
        name.length > max ||
        RegExp(_nameRegExp).hasMatch(name)) {
      return ValidationModel(
          message: errorMessage ?? "name_validator", valid: false);
    }

    return ValidationModel(
      valid: true,
    );
  }

  ValidationModel message(String text,
      {String? message, int min = 3, int max = 30}) {
    if ((text.length < min || text.length > max)) {
      return ValidationModel(
          message: message ?? "title_validator", valid: false);
    }

    return ValidationModel(
      valid: true,
    );
  }
}
