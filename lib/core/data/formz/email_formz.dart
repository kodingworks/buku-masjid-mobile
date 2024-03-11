import 'package:buku_masjid/core/core.dart';
import 'package:formz/formz.dart';

/// Enum representing possible email validation errors.
enum EmailValidationError { invalid }

/// Formz input for email validation.
class EmailFormZ extends FormzInput<String, EmailValidationError> {
  /// Constructs a pure [EmailFormZ].
  const EmailFormZ.pure() : super.pure('');

  /// Constructs a dirty [EmailFormZ] with an optional initial value.
  const EmailFormZ.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String? value) {
    return Validators.isValidEmail(value ?? '') == false &&
            value != null &&
            value.isNotEmpty
        ? EmailValidationError.invalid
        : null;
  }
}
