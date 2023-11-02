
import 'html_to_pdf_platform_interface.dart';

class HtmlToPdf {
  Future<String?> getPlatformVersion() {
    return HtmlToPdfPlatform.instance.getPlatformVersion();
  }
}
