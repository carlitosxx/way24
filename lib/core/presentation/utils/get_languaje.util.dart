import 'dart:ui';

/// Get device language
String getDeviceLanguage() {
  return PlatformDispatcher.instance.locale.languageCode;
}
