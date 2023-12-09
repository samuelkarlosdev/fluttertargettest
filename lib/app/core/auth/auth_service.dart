import 'package:flutter_target_test/app/core/validators/password_validator.dart';
import 'package:flutter_target_test/app/core/validators/user_validator.dart';

class Auth {
  register(String? user, String? password) {
    final userError = UserValidator().validate(user: user);
    final passwordError = PasswordValidator().validate(password: password);

    return userError ?? passwordError;
  }
}
