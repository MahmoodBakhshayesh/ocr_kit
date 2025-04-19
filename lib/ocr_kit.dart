
import 'enums.dart';
import 'ocr_kit_platform_interface.dart';

class OcrKit {
  Future<String?> getPlatformVersion() {
    return OcrKitPlatform.instance.getPlatformVersion();
  }

  Future<bool> pauseCamera() {
    return OcrKitPlatform.instance.pauseCamera();
  }

  Future<bool> resumeCamera() {
    return OcrKitPlatform.instance.resumeCamera();
  }

  Future<bool> changeFlashMode(OcrKitFlashMode mode) {
    return OcrKitPlatform.instance.changeFlashMode(mode);
  }

  Future<bool> switchCamera(OcrKitCameraMode mode) {
    return OcrKitPlatform.instance.switchCamera(mode);
  }
  Future<bool> getCameraPermission() {
    return OcrKitPlatform.instance.getCameraPermission();
  }
  Future<String?> takePicture() {
    return OcrKitPlatform.instance.takePicture();
  }
}
