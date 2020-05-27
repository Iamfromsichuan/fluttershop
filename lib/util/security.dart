
import 'dart:convert';

import 'package:crypto/crypto.dart';

String zhSHA256(String input) {
  String salt = 'EIpWsyfiy@R@X#qn17!StJNdZK1fFF8iV6ffN!goZkqt#JxO';
  var byte = utf8.encode(input + salt);
  var digest = sha256.convert(byte);

  return digest.toString();
}