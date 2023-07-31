class UtilValidatorData {
  static bool isEmailValid(String email) {
    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    // Regular expression for email validation
    if (password.length >= 5) {
      return true;
    }
    return false;
  }
}
