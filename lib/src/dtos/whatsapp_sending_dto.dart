/// A Data Transfer Object (DTO) class representing the result of a WhatsApp message operation.
///
/// This class encapsulates the status and message returned from a WhatsApp
/// message operation. It provides methods for serializing and deserializing the object
/// to and from a map, making it easier to send or receive the data in a format suitable
/// for storage, transmission, or processing.
class WhatsAppSendingResultDto {
  /// The status indicating whether the WhatsApp app was successfully launched.
  final bool launchingStatus;

  /// The message associated with the result, either the success message or an error message.
  final String message;

  /// Constructor to create an instance of [WhatsAppSendingResultDto].
  ///
  /// Parameters:
  /// - [launchingStatus]: A boolean indicating whether the launching attempt was successful.
  /// - [message]: A string containing a message related to the launching status.
  WhatsAppSendingResultDto({
    required this.launchingStatus,
    required this.message,
  });


  /// Converts the object into a map representation.
  ///
  /// Returns:
  /// - A map containing the serialized data of the object with keys 'launchingStatus' and 'message'.
  Map<String, dynamic> toMap() {
    return {
      'launchingStatus': launchingStatus,
      'message': message,
    };
  }
}
