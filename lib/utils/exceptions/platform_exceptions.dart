///Custom exception class to handle various fIREBASE AUTHENTICATION RELATED ERRORS.
class TFirebaseAuthException implements Exception {
  /// The error code associated with the exception
  final String code;

  /// Constructor that takes an Error code
  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already, registered. Please use a diffrenet email.';
      case 'invalid-email':
        return 'The email address provided is invalid,  Please enter a valid email.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password';
      case 'user-disabled':
        return 'The user account has been disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'wrong-password':
        return 'Incorrect password. please check your password and try again.';
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
