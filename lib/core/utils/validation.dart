class ValidationUtils {
  // Validate Password
  static bool isValidPassword(String password) {
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{3,}$');
    return regex.hasMatch(password);
  }

  // Validate Email
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  // Validate First Name and Last Name
  static bool isValidName(String name) {
    final regex = RegExp(r'^[A-Za-z]{3,10}$');
    return regex.hasMatch(name);
  }

  // Validate Sri Lankan Phone Number
  static bool isValidPhoneNumber(String phone) {
    final regex = RegExp(r'^(?:\+94|0)(7[01245678])\d{7}$');
    return regex.hasMatch(phone);
  }

  // Validate Address
  static bool isValidAddress(String address) {
    final regex = RegExp(r'^.{6,50}$');
    return regex.hasMatch(address);
  }
}
