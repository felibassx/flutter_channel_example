//
//  Geolocation.swift
//  Runner
//
//  Created by Felipe Hernández on 25-08-20.
//

import CoreLocation
import Flutter

class Geolocation: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var result: FlutterResult?
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        let clientResponse = checkPermissionStatus(status: status)
        sendResult(response: clientResponse)
    }
    
    override init() {
        super.init()
        
        // inicializar
        locationManager.delegate = self
    
    }
    
    // este metodo comprueba que no tenga una tarea previa
    func setResult(result: @escaping FlutterResult) -> Bool{
        if(self.result != nil){
            // hay una tarea en curso
            self.result?(FlutterError(code: "PENDING_RESULT_ERROR", message: "error, tienes una tarea pendiente", details: ""))
            self.result = nil
            return false
        }
        
        self.result = result
        return true
    }
    
    func sendResult(response: String) {
        self.result?(response)
        self.result = nil
    }
    
    // permiso solo cuando la aplicaion este en primer plano
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func checkPermission(result: @escaping FlutterResult) {
        let isTrue = setResult(result: result)
        
        if (isTrue) {
            let status = checkPermissionStatus(status: CLLocationManager.authorizationStatus())
            
            if (status == "ASK") {
                requestPermission()
            } else {
                sendResult(response: status)
            }
        }
    }
    
    func checkPermissionStatus(status: CLAuthorizationStatus) -> String {
                
        switch status {
            case .authorizedWhenInUse:
                return "GRANTED"
            case .denied:
                return "DENIED"
            case .restricted:
                return "RESTRICTED"
            case .notDetermined:
                return "ASK"
            default:
                return "UNKNOWN"
                
        }
    }
    
    
    
}

