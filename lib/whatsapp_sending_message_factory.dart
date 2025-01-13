import 'package:whatsapp_based_verification/src/services/whatsapp_launcher_service.dart';
import 'package:whatsapp_based_verification/whatsapp_based_verification.dart';

/// A factory class responsible for creating instances of [WhatsappSendingMessage].
///
/// This class encapsulates the creation of the [WhatsappSendingMessage] instance,
/// along with its required dependencies, promoting separation of concerns and
/// better testability in the codebase for WhatsApp-based messaging functionality.
class WhatsappSendingMessageFactory {
  /// Creates and returns an instance of [WhatsappSendingMessage] with default dependencies.
  ///
  /// This method initializes the necessary services, such as [WhatsappLauncherService],
  /// and configures the [WhatsappSendingMessage] instance to handle WhatsApp messaging
  /// actions appropriately.
  ///
  /// Returns:
  /// An initialized [WhatsappSendingMessage] instance ready for use in sending
  /// WhatsApp verification messages.
  static WhatsappSendingMessage create() {
    /// Initialize the WhatsApp launcher service, which handles the WhatsApp deep link launching.
    final WhatsappLauncherService whatsappLauncherService = WhatsappLauncherService();

    /// Get the singleton instance of WhatsappSendingMessage.
    final WhatsappSendingMessage whatsappSendingMessage = WhatsappSendingMessage.instance;

    /// Initialize the WhatsappSendingMessage instance with the WhatsApp launcher service.
    whatsappSendingMessage.initialize(whatsappLauncherService);

    /// Return the configured WhatsappSendingMessage instance.
    return whatsappSendingMessage;
  }
}
