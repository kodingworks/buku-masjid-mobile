/// Enum representing different authentication states.
enum Auth {
  /// User is authorized.
  authorized,

  /// User is unauthorized.
  unAuthorized,

  /// Initial authentication state.
  initial,

  /// User permission is denied.
  permissionDenied,
}
