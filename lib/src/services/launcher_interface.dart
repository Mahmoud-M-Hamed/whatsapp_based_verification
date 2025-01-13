import 'package:whatsapp_based_verification/src/handlers/whatsapp_message_result_handler.dart';

/// An abstract interface for launching WhatsApp with a pre-filled message.
///
/// This interface defines the contract for any service that aims to launch
/// WhatsApp with a message to a specified phone number. Implementations of
/// this interface will handle the actual launching of WhatsApp and manage
/// the result of that action.
abstract class IWhatsappLauncherService {
  /// Launches the WhatsApp application with a pre-filled message.
  ///
  /// Parameters:
  /// - [message]: The content of the message to be pre-filled in WhatsApp.
  /// - [phoneNumber]: The recipient's phone number in international format.
  /// - [callback]: A callback function that will handle the result of the WhatsApp launch.
  ///
  /// This method is expected to launch WhatsApp with the given message and
  /// phone number, and then invoke the callback function with the result
  /// of the operation.
  Future<void> launch({
    required String message,
    required String phoneNumber,
    required SendingMessageResultCallback callback,
  });
}
