import 'package:whatsapp_based_verification/src/dtos/whatsapp_sending_dto.dart';

/// A handler class responsible for processing and converting the result of WhatsApp message operations.
///
/// This class encapsulates the logic for converting a `WhatsAppSendingResultDto` into a map
/// format that can be returned to the caller, typically to be handled by the callback function.
class WhatsAppMessageResultHandler {
  /// Processes the result of the WhatsApp message operation and returns a map.
  ///
  /// Parameters:
  /// - [sendingResultDto]: An instance of [WhatsAppSendingResultDto] containing
  ///   the status and message of the WhatsApp launch operation.
  ///
  /// Returns:
  /// - A [Map<String, dynamic>] representation of the result from the [sendingResultDto],
  ///   which can then be used for further processing or callback handling.
  Map<String, dynamic> callbackResultHandler({
    required WhatsAppSendingResultDto sendingResultDto,
  }) {
    // Converts the result DTO to a map and returns it
    return sendingResultDto.toMap();
  }
}

typedef SendingMessageResultCallback = void Function(Map<String, dynamic> result);
