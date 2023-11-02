import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'html_to_pdf_platform_interface.dart';

/// An implementation of [HtmlToPdfPlatform] that uses method channels.
class MethodChannelHtmlToPdf extends HtmlToPdfPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('html_to_pdf');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
