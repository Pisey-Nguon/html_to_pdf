import 'package:flutter_test/flutter_test.dart';
import 'package:html_to_pdf/html_to_pdf.dart';
import 'package:html_to_pdf/html_to_pdf_platform_interface.dart';
import 'package:html_to_pdf/html_to_pdf_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHtmlToPdfPlatform
    with MockPlatformInterfaceMixin
    implements HtmlToPdfPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final HtmlToPdfPlatform initialPlatform = HtmlToPdfPlatform.instance;

  test('$MethodChannelHtmlToPdf is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHtmlToPdf>());
  });

  test('getPlatformVersion', () async {
    HtmlToPdf htmlToPdfPlugin = HtmlToPdf();
    MockHtmlToPdfPlatform fakePlatform = MockHtmlToPdfPlatform();
    HtmlToPdfPlatform.instance = fakePlatform;

    expect(await htmlToPdfPlugin.getPlatformVersion(), '42');
  });
}
