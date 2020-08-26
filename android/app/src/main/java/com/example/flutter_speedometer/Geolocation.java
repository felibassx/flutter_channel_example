package com.example.flutter_speedometer;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;

import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import io.flutter.plugin.common.MethodChannel;

public class Geolocation {

    final static int REQUEST_ACCESS_FINE_LOCATION = 505051;
    private Activity activity;

    Geolocation(Activity activity) {
        this.activity = activity;
    }

    MethodChannel.Result result;

   private boolean setResult(MethodChannel.Result result) {

       if(this.result != null) {
           this.result.error("PENDING_RESULT_ERROR", "Error, tienes una tarea pendiente", "");
           this.result = null;
           return false;
       }

       this.result = result;
       return true;
    }

    public void sendResult(String response) {
       this.result.success(response);
       this.result = null;
    }

    private void requestPermission(){

        ActivityCompat.requestPermissions(this.activity,
                new String[]{Manifest.permission.ACCESS_FINE_LOCATION},
                REQUEST_ACCESS_FINE_LOCATION);

    }

    public void checkPermission(MethodChannel.Result result) {

       if(setResult(result)) {
           if (ContextCompat.checkSelfPermission(
                   this.activity, Manifest.permission.ACCESS_FINE_LOCATION) !=
                   PackageManager.PERMISSION_GRANTED) {
               requestPermission();

           } else {
               sendResult("GRANTED");
           }
       }

    }

}
