import 'package:flutter/services.dart';

class GeolocationPermissionsStatus {
  static const granted = "GRANTED";
  static const denied = "DENIED";
  static const unknown = "UNKNOWN";
}

class Geolocation {
  final _channel = MethodChannel('cl.kafecode/geolocation');

  Future<String> requestPermissions() async {
    print('Llamando requestPermission');
    final result = await _channel.invokeMethod('permission');
    print('requestPermission status: $result');
    return result;
  }
}
