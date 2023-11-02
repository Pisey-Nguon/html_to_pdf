import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'html_to_pdf_method_channel.dart';

abstract class HtmlToPdfPlatform extends PlatformInterface {
  /// Constructs a HtmlToPdfPlatform.
  HtmlToPdfPlatform() : super(token: _token);

  static final Object _token = Object();

  static HtmlToPdfPlatform _instance = MethodChannelHtmlToPdf();

  /// The default instance of [HtmlToPdfPlatform] to use.
  ///
  /// Defaults to [MethodChannelHtmlToPdf].
  static HtmlToPdfPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HtmlToPdfPlatform] when
  /// they register themselves.
  static set instance(HtmlToPdfPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
