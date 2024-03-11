import 'package:buku_masjid/core/core.dart';
import 'package:formz/formz.dart';

/// Enum representing possible phone number validation errors.
enum PhoneValidationError { invalid }

/// Formz input for phone number validation.
class PhoneFormZ extends FormzInput<String, PhoneValidationError> {
  /// Constructs a pure [PhoneFormZ].
  const PhoneFormZ.pure() : super.pure('');

  /// Constructs a dirty [PhoneFormZ] with an optional initial value.
  const PhoneFormZ.dirty([super.value = '']) : super.dirty();

  @override
  PhoneValidationError? validator(String? value) {
    return (!Validators.isValidPhoneNumber(value ?? '') ||
                (value ?? '').length < 10) &&
            value != null &&
            value.isNotEmpty
        ? PhoneValidationError.invalid
        : null;
  }
}
