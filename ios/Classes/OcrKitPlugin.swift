import Flutter
import AVFoundation
import UIKit

public class OcrKitPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ocr_kit", binaryMessenger: registrar.messenger())
    let instance = OcrKitPlugin()

    let ocrFactory = CameraKitOcrPlusViewFactory(messenger: registrar.messenger())

    registrar.register(ocrFactory, withId: "ocr-kit-view")
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "getCameraPermission":
        requestCameraPermission(result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }



    func requestCameraPermission(result:  @escaping FlutterResult) {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            // Permission granted, proceed with setup
            result(true)
        case .notDetermined:
            // Request permission
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    result(true)
                }
            }
        case .denied, .restricted:
            // Permission denied or restricted
            let alert = UIAlertController(
                title: "Camera Access Required",
                message: "Camera access is required to use this feature. Please enable it in the Settings app.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Settings", style: .default) { _ in
                if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(settingsURL)
                }
            })

            // Present the alert
            DispatchQueue.main.async {
                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
            }
            result(true)
        @unknown default:
            result(false)
        }
    }


}
