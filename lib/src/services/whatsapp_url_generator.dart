import 'package:whatsapp_based_verification/src/services/parsing_uri_interface.dart';
import 'package:whatsapp_based_verification/src/services/url_generation_interface.dart';

class WhatsAppUrlGenerator implements IUrlGenerationService, IParsingUriService {
  String _generateWhatsappUrl(String phoneNumber, String message) {
    final encodedMessage = encodedUrl(encodedText: message);
    return 'https://wa.me/$phoneNumber?text=$encodedMessage';
  }

  Uri generateUri({required String phoneNumber, required String message}) => parseUri(
        uri: _generateWhatsappUrl(phoneNumber, message),
      );

  @override
  String encodedUrl({required String encodedText}) => Uri.encodeComponent(encodedText);

  @override
  Uri parseUri({required String uri}) => Uri.parse(uri);
}
