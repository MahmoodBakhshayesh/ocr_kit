import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'enums.dart';
import 'ocr_kit_method_channel.dart';

abstract class OcrKitPlatform extends PlatformInterface {
  /// Constructs a OcrKitPlatform.
  OcrKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static OcrKitPlatform _instance = MethodChannelOcrKit();

  /// The default instance of [OcrKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelOcrKit].
  static OcrKitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OcrKitPlatform] when
  /// they register themselves.
  static set instance(OcrKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> pauseCamera() {
    throw UnimplementedError('pauseCamera() has not been implemented.');
  }

  Future<bool> resumeCamera() {
    throw UnimplementedError('resumeCamera() has not been implemented.');
  }

  Future<bool> changeFlashMode(OcrKitFlashMode mode) {
    throw UnimplementedError('changeFlashMode(mode) has not been implemented.');
  }

  Future<bool> switchCamera(OcrKitCameraMode mode) {
    throw UnimplementedError('switchCamera(mode) has not been implemented.');
  }

  Future<bool> getCameraPermission() {
    throw UnimplementedError('getCameraPermissionhas not been implemented.');
  }

  Future<String?> takePicture() {
    throw UnimplementedError('takePicture not been implemented.');
  }
}
