import './constants.dart';

//Regexs
final RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp passwordRegExp =
    RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$');

final ErrorStrings errorStrings = ErrorStrings();

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return errorStrings.error_message_field_required;
  }

  if (!emailRegExp.hasMatch(value)) {
    return errorStrings.error_message_valid_email_id;
  }

  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return errorStrings.error_message_field_required;
  }

  if (value.length < 6) {
    return errorStrings.error_message_password_min_characters;
  }
  if (value.length > 10) {
    return errorStrings.error_message_password_max_characters;
  }

  if (!passwordRegExp.hasMatch(value)) {
    return errorStrings.error_message_valid_password;
  }

  return null;
}
