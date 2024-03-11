import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/helpers/validators.dart';

void main() {
  group('Validators', () {
    test('nameValidator should return true for valid names', () {
      // Arrange
      final validNames = [
        'john',
        'Doe',
        'user_name',
        'name123',
        'user-name',
        'name_with.dot'
      ];

      // Act & Assert
      for (final name in validNames) {
        expect(Validators.nameValidator(name), true);
      }
    });

    test('nameValidator should return false for invalid names', () {
      // Arrange
      final invalidNames = [
        'John Doe',
        'user name',
        '-username',
        '.username',
        'username-',
        'username.'
      ];

      // Act & Assert
      for (final name in invalidNames) {
        expect(Validators.nameValidator(name), false);
      }
    });

    test('isValidEmail should return true for valid emails', () {
      // Arrange
      final validEmails = [
        'test@example.com',
        'john.doe@gmail.com',
        'user123@hotmail.co.uk'
      ];

      // Act & Assert
      for (final email in validEmails) {
        expect(Validators.isValidEmail(email), true);
      }
    });

    test('isValidEmail should return false for invalid emails', () {
      // Arrange
      final invalidEmails = [
        'not_an_email',
        'invalid.com',
        'test@.com',
        'test@domain'
      ];

      // Act & Assert
      for (final email in invalidEmails) {
        expect(Validators.isValidEmail(email), false);
      }
    });

    test('isValidPassword should return true for valid passwords', () {
      // Arrange
      final validPasswords = ['123456', 'password', 'secure123'];

      // Act & Assert
      for (final password in validPasswords) {
        expect(Validators.isValidPassword(password), true);
      }
    });

    test('isValidPassword should return false for invalid passwords', () {
      // Arrange
      final invalidPasswords = ['12345', 'pass', '123'];

      // Act & Assert
      for (final password in invalidPasswords) {
        expect(Validators.isValidPassword(password), false);
      }
    });

    test('isValidPhoneNumber should return true for valid phone numbers', () {
      // Arrange
      final validPhoneNumbers = ['1234567890'];

      // Act & Assert
      for (final phoneNumber in validPhoneNumbers) {
        expect(Validators.isValidPhoneNumber(phoneNumber), true);
      }
    });

    test('isValidPhoneNumber should return false for invalid phone numbers',
        () {
      // Arrange
      final invalidPhoneNumbers = ['abc', '12345'];

      // Act & Assert
      for (final phoneNumber in invalidPhoneNumbers) {
        expect(Validators.isValidPhoneNumber(phoneNumber), false);
      }
    });

    test('isValidPostalCode should return true for valid postal codes', () {
      // Arrange
      final validPostalCodes = ['12345', '12345-6789'];

      // Act & Assert
      for (final postalCode in validPostalCodes) {
        expect(Validators.isValidPostalCode(postalCode), true);
      }
    });

    test('isValidPostalCode should return false for invalid postal codes', () {
      // Arrange
      final invalidPostalCodes = ['abcde', '1234', '123456'];

      // Act & Assert
      for (final postalCode in invalidPostalCodes) {
        expect(Validators.isValidPostalCode(postalCode), false);
      }
    });

    test(
        'isTextNonNull should return true for non-null text with length greater than limit',
        () {
      // Arrange
      const text = 'some text';

      // Act & Assert
      expect(Validators.isTextNonNull(text, limit: 5), true);
    });

    test('isTextNonNull should return false for null text', () {
      // Arrange
      const text = 'text';

      // Act & Assert
      expect(Validators.isTextNonNull(text), true);
    });

    test(
        'isTextNonNull should return false for text with length less than or equal to limit',
        () {
      // Arrange
      const text = 'text';

      // Act & Assert
      expect(Validators.isTextNonNull(text, limit: 5), false);
    });
  });
}
