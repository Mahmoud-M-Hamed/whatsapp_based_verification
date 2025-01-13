import 'package:whatsapp_based_verification/src/handlers/whatsapp_message_result_handler.dart';
import 'package:whatsapp_based_verification/src/services/whatsapp_launcher_service.dart';

/// The main class for managing WhatsApp messaging operations.
class WhatsappSendingMessage {
  /// The singleton instance of [WhatsappSendingMessage].
  static final WhatsappSendingMessage _instance = WhatsappSendingMessage._internal();

  /// Returns the singleton instance of [WhatsappSendingMessage].
  static WhatsappSendingMessage get instance => _instance;

  /// Private constructor to ensure the singleton pattern.
  WhatsappSendingMessage._internal();

  /// The service for handling WhatsApp messaging actions, such as launching WhatsApp with a message.
  late final WhatsappLauncherService _whatsappLauncherService;

  /// Initializes the WhatsApp launcher service with required dependencies.
  ///
  /// [whatsappLauncherService]: The service responsible for handling WhatsApp deep linking.
  void initialize(WhatsappLauncherService whatsappLauncherService) {
    _whatsappLauncherService = whatsappLauncherService;
  }

  /// Launches the WhatsApp app to send a verification message.
  ///
  /// Parameters:
  /// - [message]: The verification message to be sent.
  /// - [phoneNumber]: The recipient's phone number, including the country code.
  /// - [callback]: A callback function to handle the result of the message operation.
  ///
  /// This method uses the [_whatsappLauncherService] to generate the WhatsApp deep link
  /// and launches it to initiate the message sending process.
  Future<void> sendingVerificationMessageViaWhatsApp(
      String message,
      String phoneNumber,
      SendingMessageResultCallback callback,
      ) async {
    await _whatsappLauncherService.launch(
      message: message,
      phoneNumber: phoneNumber,
      callback: callback,
    );
  }
}
