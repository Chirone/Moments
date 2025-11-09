import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

dLog(String message) {
  if (kReleaseMode) {
    return;
  }
  final line = StackTrace.current.toString().split('\n')[1];
  final colonIdx = line.indexOf(':');
  final fileLink = line.substring(colonIdx, line.length);
  final fileName = fileLink.split('/').last.split('.').first;
  dev.log('$message\n\t\t(package$fileLink}', name: fileName);
}
