import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    
    let geolocation = Geolocation()
    
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        
        let controller = window.rootViewController as! FlutterBinaryMessenger
        let channel = FlutterMethodChannel(name: "cl.kafecode/geolocation", binaryMessenger: controller)
        
        channel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult)->Void in
            
           
            switch call.method {
            
                case "permission":
                    self.geolocation.checkPermission(result: result)
                    
                    
                
                
            default: result(FlutterMethodNotImplemented)

            }
        })
        
        
        // Ejemplo implementacion de Flutter CHANNEL en IOS
        /*
         let controller = window.rootViewController as! FlutterBinaryMessenger
         let channel = FlutterMethodChannel(name: "cl.kafecode/natice_text", binaryMessenger: controller)
         
         channel.setMethodCallHandler({
         (call: FlutterMethodCall, result: FlutterResult)->Void in
         
         let arguments = call.arguments as? [String: Any]
         
         switch call.method {
         
         case "getText":
         let dartText = arguments?["text"] as! String
         let age = arguments?["edad"] as! Int
         result("IOS is here \(dartText) \(age)")
         
         case "addText":
         result("IOS add is here")
         
         default: result(FlutterMethodNotImplemented)
         
         }
         })
         */
        // Hasta aquí el ejemplo
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

// cl.kafecode/natice_text
