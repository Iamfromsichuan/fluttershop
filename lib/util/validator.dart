bool isEmail(String input) {
  String regexpEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
  return RegExp(regexpEmail).hasMatch(input);
}

bool checkPasswordLength(String input, int length) {
  if (input == null || input.isEmpty) return false;
  return input.length > length;
}
