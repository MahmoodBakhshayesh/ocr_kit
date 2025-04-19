// import 'package:flutter_test/flutter_test.dart';
// import 'package:ocr_kit/ocr_kit.dart';
// import 'package:ocr_kit/ocr_kit_platform_interface.dart';
// import 'package:ocr_kit/ocr_kit_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockOcrKitPlatform
//     with MockPlatformInterfaceMixin
//     implements OcrKitPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final OcrKitPlatform initialPlatform = OcrKitPlatform.instance;
//
//   test('$MethodChannelOcrKit is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelOcrKit>());
//   });
//
//   test('getPlatformVersion', () async {
//     OcrKit ocrKitPlugin = OcrKit();
//     MockOcrKitPlatform fakePlatform = MockOcrKitPlatform();
//     OcrKitPlatform.instance = fakePlatform;
//
//     expect(await ocrKitPlugin.getPlatformVersion(), '42');
//   });
// }
