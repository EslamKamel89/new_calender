import 'package:flutter/foundation.dart';

T pr<T>(T variable, [String? title]) {
  if (kDebugMode) {
    String message =
        '< eslam dev ${title == null ? "" : " - $title"}> ' '$variable';
    print(message);
  }
  return variable;
}

// yellow
String _toYellow(String text) {
  return '\x1B[33m$text\x1B[0m';
}

// red
String _toRed(String text) {
  return '\x1B[31m$text\x1B[0m';
}

// blue
String _toBlue(String text) {
  return '\x1B[34m$text\x1B[0m';
}

//green
String _toGreen(String text) {
  return '\x1B[32m$text\x1B[0m';
}
