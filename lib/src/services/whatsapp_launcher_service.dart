import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_based_verification/src/dtos/whatsapp_sending_dto.dart';
import 'package:whatsapp_based_verification/src/handlers/whatsapp_message_result_handler.dart';
import 'package:whatsapp_based_verification/src/services/launcher_interface.dart';
import 'package:whatsapp_based_verification/src/services/whatsapp_url_generator.dart';

/// A service responsible for launching WhatsApp with a pre-filled message.
/// This class constructs WhatsApp deep links, attempts to launch the app,
/// and returns the result via a callback.
class WhatsappLauncherService implements IWhatsappLauncherService {
  /// Instance of the handler that processes the result of WhatsApp launch attempts.
  final WhatsAppMessageResultHandler _resultHandler = WhatsAppMessageResultHandler();

  @override
  Future<void> launch({
    required String message,
    required String phoneNumber,
    required SendingMessageResultCallback callback,
  }) async {
    try {
      final result = await _attemptLaunchWhatsApp(message, phoneNumber);
      _invokeCallback(callback, result);
    } catch (e) {
      final errorResult = WhatsAppSendingResultDto(
        launchingStatus: false,
        message: 'Could not launch WhatsApp app: ${e.toString()}',
      );
      _invokeCallback(callback, errorResult);
    }
  }

  /// Tries to launch WhatsApp with the given message and phone number.
  ///
  /// Returns the result as a [WhatsAppSendingResultDto].
  Future<WhatsAppSendingResultDto> _attemptLaunchWhatsApp(
    String message,
    String phoneNumber,
  ) async {
    final Uri whatsappUri = WhatsAppUrlGenerator().generateUri(phoneNumber: phoneNumber, message: message);

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
      return WhatsAppSendingResultDto(
        launchingStatus: true,
        message: 'WhatsApp Launched successfully',
      );
    } else {
      throw Exception('Could not launch WhatsApp app');
    }
  }

  /// Invokes the callback function with the given result.
  ///
  /// Parameters:
  /// - [callback]: The callback to be invoked.
  /// - [result]: The result data transfer object to be passed to the callback.
  void _invokeCallback(SendingMessageResultCallback callback, WhatsAppSendingResultDto result) {
    final callbackResult = _resultHandler.callbackResultHandler(sendingResultDto: result);
    callback(callbackResult);
  }
}
