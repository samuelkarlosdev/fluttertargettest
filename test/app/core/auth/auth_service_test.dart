import 'package:flutter_target_test/app/core/auth/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Auth auth;

  setUp(() {
    auth = Auth();
  });

  group("Validator Auth", () {
    test("Check User and Passwors is invalid", () {
      final result = auth.register('123 ', '123&');

      expect(result, isA<String>());
    });

    test("Check User and Passwors is valid", () {
      final result = auth.register('joao', '1234asdf');

      expect(result, isNull);
    });
  });
}
