package com.example.flutter_speedometer;


import android.content.pm.PackageManager;
import android.os.Bundle;

import androidx.annotation.NonNull;

import io.flutter.app.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    Geolocation geolocation;

    @Override
    public void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(new FlutterEngine(this));

        geolocation = new Geolocation(this);

        MethodChannel channel = new MethodChannel(getFlutterView(), "cl.kafecode/geolocation");

        channel.setMethodCallHandler((call, result) -> {

            switch (call.method){

                case "permission":
                    geolocation.checkPermission(result);
                    break;
                default: result.notImplemented();
            }
        });

        /*
        channel.setMethodCallHandler((call, result) -> {

            switch (call.method){

                case "getText":
                    String text = call.argument("text");
                    int age = call.argument("edad");
                    result.success("Android get is here "+ text + age);
                    break;
                case "addText":
                    result.success("Android add is here");
                    break;
                default: result.notImplemented();
            }
        });
        */


    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);

        if(requestCode==Geolocation.REQUEST_ACCESS_FINE_LOCATION) {
            if(grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                geolocation.sendResult("GRANTED");
            } else {
                geolocation.sendResult("DENIED");
            }
        }
    }
}
