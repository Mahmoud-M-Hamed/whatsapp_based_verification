import 'package:flutter/material.dart';
import 'package:whatsapp_based_verification/whatsapp_sending_message_factory.dart';
import 'package:whatsapp_based_verification/whatsapp_based_verification.dart';

void main() {
  runApp(const WhatsAppHomeScreen());
}

/// The main application widget.
/// The main screen for WhatsApp-based messaging functionality.
/// Displays a form to send WhatsApp verification messages.
class WhatsAppHomeScreen extends StatefulWidget {
  const WhatsAppHomeScreen({super.key});

  @override
  State<WhatsAppHomeScreen> createState() => _WhatsAppHomeScreenState();
}

/// State class for the WhatsAppHomeScreen.
/// Manages the state and interactions within the screen.
class _WhatsAppHomeScreenState extends State<WhatsAppHomeScreen> {
  /// An instance of the service responsible for handling WhatsApp message operations.
  final WhatsappSendingMessageService _whatsappSendingMessageService = WhatsappSendingMessageService();

  /// A key used to identify the form and manage its validation state.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Controllers for user inputs.
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _verificationMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp Messaging App'), // Displays the title of the app.
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Please enter a valid mobile number with the country code (e.g., +20).',
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  controller: _mobileNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    errorMaxLines: 2,
                    errorStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ), // Customize the error message.
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mobile number can\'t be empty.';
                    } else if (value.length != 13) {
                      return 'Mobile number must be 13 digits, including the country code.';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text('Please enter the verification message'),
                TextFormField(
                  controller: _verificationMessageController,
                  decoration: const InputDecoration(
                    labelText: 'Verification Message',
                    errorMaxLines: 2,
                    errorStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ), // Customize the error message.
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Verification message can\'t be empty.';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _whatsappSendingMessageService.verifyMessage(
                        phoneNumber: _mobileNumberController.text,
                        message: _verificationMessageController.text,
                        callback: (result) => _whatsappSendingMessageService.handleMessageResult(result),
                      );
                    }
                  }, // Calls the send WhatsApp message method when pressed.
                  child: const Text('Send Verification Message'), // Button text to indicate action.
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A service class that handles WhatsApp message sending functionality.
/// It manages the logic for sending verification messages using the WhatsApp plugin.
class WhatsappSendingMessageService {
  /// Instance of the plugin for sending WhatsApp messages.
  final WhatsappSendingMessage _whatsappSendingMessagePlugin = WhatsappSendingMessageFactory.create();

  /// Sends a WhatsApp message using the WhatsApp plugin.
  ///
  /// Parameters:
  /// - [message]: The verification message to send.
  /// - [phoneNumber]: The recipient's mobile number (including the country code).
  /// - [callback]: A callback function to handle the result of the message sending operation.
  Future<void> verifyMessage({
    required String message,
    required String phoneNumber,
    required void Function(Map<String, dynamic> result) callback,
  }) async {
    await _whatsappSendingMessagePlugin.sendingVerificationMessageViaWhatsApp(
      message,
      phoneNumber,
      callback,
    );
  }

  /// Handles the result of the WhatsApp message sending action.
  ///
  /// Logs the result of the operation for debugging purposes.
  ///
  /// [result]: A map containing the status of the message sending operation.
  void handleMessageResult(Map<String, dynamic> result) {
    debugPrint('Result: $result'); // Outputs the result of sending the message.
  }
}
