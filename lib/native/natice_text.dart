import 'package:flutter/services.dart';

class NaticeText {
  final _platform = MethodChannel('cl.kafecode/natice_text');

  Future<String> getText(String text) async {
    String result =
        await _platform.invokeMethod('getText', {'text': text, 'edad': 39});

    return result;
  }

  Future<String> addText(String text) async {
    String result = await _platform.invokeMethod('addText');

    return result;
  }
}
