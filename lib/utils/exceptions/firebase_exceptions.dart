///Custom exception class to handle various fIREBASE AUTHENTICATION RELATED ERRORS.
class TFirebaseException implements Exception {
  /// The error code associated with the exception
  final String code;

  /// Constructor that takes an Error code
  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error ocurred, Please try again.';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token';
      case 'custom-token-mismatch':
        return 'The custom token correspondence to a different audiance.';
      case 'user-disabled':
        return 'The user account has been disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'wrong-password':
        return 'Incorrect password. please check your password and try again.';
      case 'weak-password':
        return 'The password is too weak please choose a stronger password';
      case 'invalid-verification-id':
        return 'Invalid verification id, Please request a new verification code';
      case 'quota-exceeded':
        return 'Quota exceeded, Please try again later.';
      case 'email-already-exists':
        return 'Email Already exists please us a differrent email';
      default:
        return '$code';
    }
  }
}
