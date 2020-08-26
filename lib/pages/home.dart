import 'package:flutter/material.dart';
import 'package:flutter_speedometer/native/geolocation.dart';
// import 'package:flutter_speedometer/native/natice_text.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final _nativeText = NaticeText();

  // var _text = '';

  // _getText() async {
  //   final text = await _nativeText.getText('flutter is HERE');
  //   setState(() {
  //     this._text = text;
  //   });
  // }

  final _geolocation = new Geolocation();

  _checkPermissions() async {
    final status = await _geolocation.requestPermissions();

    switch (status) {
      case GeolocationPermissionsStatus.granted:
        break;
      case GeolocationPermissionsStatus.denied:
        break;
      case GeolocationPermissionsStatus.unknown:
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // child: Text('$_text'),
          ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _getText,
      //   child: Icon(Icons.add_box),
      // ),
    );
  }
}
