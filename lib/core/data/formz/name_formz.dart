import 'package:buku_masjid/core/core.dart';
import 'package:formz/formz.dart';

/// Enum representing possible name validation errors.
enum NameValidationError { invalid }

/// Formz input for name validation.
class NameFormZ extends FormzInput<String, NameValidationError> {
  /// Constructs a pure [NameFormZ].
  const NameFormZ.pure() : super.pure('');

  /// Constructs a dirty [NameFormZ] with an optional initial value.
  const NameFormZ.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String? value) {
    return Validators.nameValidator(value ?? '') &&
            (value ?? '').length <= 2 &&
            value != null &&
            value.isNotEmpty
        ? NameValidationError.invalid
        : null;
  }
}
