class Validators {
  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  static final RegExp _phoneRegExp = RegExp(
    r'''(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|
2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|
4[987654310]|3[9643210]|2[70]|7|1)\d{6,14}$''',
  );

  static final RegExp _postCodeRegExp = RegExp(r'^[0-9]{5}(?:-[0-9]{4})?$');

  /// Validates a name string.
  ///
  /// The name should only contain alphanumeric characters, dashes, underscores, and dots.
  /// It must start and end with an alphanumeric character.
  /// Returns `true` if the name is valid, otherwise `false`.
  static bool nameValidator(String text) {
    RegExp exp = RegExp("^[a-zA-Z0-9]+((_|-|\\.)?[a-zA-Z0-9])*\$");
    if (!exp.hasMatch(text) && text.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  /// Validates an email address.
  ///
  /// Returns `true` if the email is valid, otherwise `false`.
  static bool isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  /// Validates a password.
  ///
  /// The password should have a length greater than 6 characters.
  /// Returns `true` if the password is valid, otherwise `false`.
  static bool isValidPassword(String password) {
    return password.length >= 6;
  }

  /// Validates a phone number.
  ///
  /// Returns `true` if the phone number is valid, otherwise `false`.
  static bool isValidPhoneNumber(String phone) {
    return _phoneRegExp.hasMatch(phone);
  }

  /// Validates a postal code.
  ///
  /// Returns `true` if the postal code is valid, otherwise `false`.
  static bool isValidPostalCode(String code) {
    return _postCodeRegExp.hasMatch(code);
  }

  /// Checks if a text is non-null and has a length greater than `limit`.
  ///
  /// Returns `true` if the text is non-null and its length is greater than `limit`, otherwise `false`.
  static bool isTextNonNull(String text, {int limit = 0}) {
    return text.isNotEmpty && text.length > limit;
  }
}
