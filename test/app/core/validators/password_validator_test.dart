import 'package:flutter_target_test/app/core/validators/password_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PasswordValidator passwordValidator;

  setUp(() {
    passwordValidator = PasswordValidator();
  });

  group('Validate password', () {
    test("Check password field is null", () {
      final result = passwordValidator.validate();

      expect(result, equals('O Campo Password é obrigatório!'));
    });

    test("Check password field is empty", () {
      final result = passwordValidator.validate(password: '');

      expect(result, equals('O Campo Password é obrigatório!'));
    });

    test("Check user field is more than 2 characters", () {
      final result = passwordValidator.validate(password: '1');

      expect(
          result, equals('O Campo Password deve ter pelo menos 2 caracteres!'));
    });

    test("Check password field has special characters", () {
      final result = passwordValidator.validate(password: '123&');

      expect(result, equals('O Campo Password contém caracteres especiais!'));
    });

    test("Check password field is less than 20 characters", () {
      final result =
          passwordValidator.validate(password: 'qwertyuiopasdfghjklçz');

      expect(
          result, equals('O Campo Password deve ser menor que 20 caracteres!'));
    });

    test("Check password field is space at the end", () {
      final result = passwordValidator.validate(password: '123 ');

      expect(
          result, equals('O Campo Password não deve conter espaço no final!'));
    });

    test("Check password field is valid", () {
      final result = passwordValidator.validate(password: '123456');

      expect(result, isNull);
    });
  });
}
