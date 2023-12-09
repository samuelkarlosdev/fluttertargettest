import 'package:flutter_target_test/app/core/validators/user_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late UserValidator emailValidator;

  setUp(() {
    emailValidator = UserValidator();
  });

  group('Validator user', () {
    test("Check user field is null", () {
      final result = emailValidator.validate();

      expect(result, equals('O Campo Usuário é obrigatório!'));
    });

    test("Check user field is empty", () {
      final result = emailValidator.validate(user: '');

      expect(result, equals('O Campo Usuário é obrigatório!'));
    });

    test("Check user field is less than 20 characters", () {
      final result = emailValidator.validate(user: 'qwertyuiopasdfghjklçz');

      expect(
          result, equals('O Campo Usuário deve ser menor que 20 caracteres!'));
    });

    test("Check user field is space at the end", () {
      final result = emailValidator.validate(user: 'test ');

      expect(
          result, equals('O Campo Usuário não deve conter espaço no final!'));
    });

    test("Check user field is valid", () {
      final result = emailValidator.validate(user: 'test');

      expect(result, isNull);
    });
  });
}
