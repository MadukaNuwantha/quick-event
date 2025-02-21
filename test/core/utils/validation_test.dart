import 'package:app/core/utils/validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'ValidationUtils Tests',
    () {
      test(
        'Valid Passwords',
        () {
          expect(ValidationUtils.isValidPassword('Ab0'), true);
          expect(ValidationUtils.isValidPassword('A1b'), true);
        },
      );

      test(
        'Invalid Passwords',
        () {
          expect(ValidationUtils.isValidPassword('abc123'), false);
          expect(ValidationUtils.isValidPassword('ABC123'), false);
          expect(ValidationUtils.isValidPassword('Abc'), false);
          expect(ValidationUtils.isValidPassword('A1'), false);
        },
      );

      test(
        'Valid Emails',
        () {
          expect(ValidationUtils.isValidEmail('test@example.com'), true);
          expect(ValidationUtils.isValidEmail('user123@mail.co.uk'), true);
        },
      );

      test(
        'Invalid Emails',
        () {
          expect(ValidationUtils.isValidEmail('invalid-email'), false);
          expect(ValidationUtils.isValidEmail('test@com'), false);
          expect(ValidationUtils.isValidEmail('user@.com'), false);
        },
      );

      test(
        'Valid Names',
        () {
          expect(ValidationUtils.isValidName('John'), true);
          expect(ValidationUtils.isValidName('Michael'), true);
        },
      );

      test(
        'Invalid Names',
        () {
          expect(ValidationUtils.isValidName('Jo'), false);
          expect(ValidationUtils.isValidName('ThisNameIsTooLong'), false);
          expect(ValidationUtils.isValidName('John123'), false);
        },
      );

      test(
        'Valid Sri Lankan Phone Numbers',
        () {
          expect(ValidationUtils.isValidPhoneNumber('+94771234567'), true);
          expect(ValidationUtils.isValidPhoneNumber('+94771234567'), true);
        },
      );

      test(
        'Invalid Sri Lankan Phone Numbers',
        () {
          expect(ValidationUtils.isValidPhoneNumber('1234567890'), false);
          expect(ValidationUtils.isValidPhoneNumber('07123'), false);
          expect(ValidationUtils.isValidPhoneNumber('+94123456789'), false);
        },
      );

      test(
        'Valid Addresses',
        () {
          expect(ValidationUtils.isValidAddress('123 Main St'), true);
          expect(ValidationUtils.isValidAddress('Colombo 07'), true);
        },
      );

      test(
        'Invalid Addresses',
        () {
          expect(ValidationUtils.isValidAddress('A'), false);
          expect(ValidationUtils.isValidAddress('A' * 51), false);
        },
      );
    },
  );
}
