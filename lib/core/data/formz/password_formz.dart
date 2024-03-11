import 'package:buku_masjid/core/core.dart';
import 'package:formz/formz.dart';

/// Enum representing possible password validation errors.
enum PasswordValidationError { invalid }

/// Formz input for password validation.
class PasswordFormZ extends FormzInput<String, PasswordValidationError> {
  /// Constructs a pure [PasswordFormZ].
  const PasswordFormZ.pure() : super.pure('');

  /// Constructs a dirty [PasswordFormZ] with an optional initial value.
  const PasswordFormZ.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String? value) {
    return Validators.isValidPassword(value ?? '') == false &&
            value != null &&
            value.isNotEmpty
        ? PasswordValidationError.invalid
        : null;
  }
}
