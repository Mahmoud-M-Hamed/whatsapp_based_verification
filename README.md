# whatsapp_based_verification
## High-Level Flow 

Simplify integrating WhatsApp-based verification into your Flutter apps with this powerful plugin. 
Allowing your app to send verification messages to users effortlessly.
By leveraging WhatsApp's communication capabilities, this plugin helps reduce dependency on costly SMS services and minimizes waste by ensuring the user initiates the verification process.
With a simple API and platform abstraction, you can focus on building core app features while delivering your users a secure and efficient verification experience.

**Plugin input parameters from the mobile app developer:**

 [message]: The verification message will be sent to the WhatsApp phone number from your app through whatsapp_based_verification.
 [phoneNumber]: The recipient's phone number.
 [callback]: A callback function to handle the result of the message operation.

**For more information or if you need any support, please communicate via email:**

## Technical Details

**1. Introduction**

The Content-Based Verification plugin streamlines the process of integrating WhatsApp-based verification into Flutter apps. It abstracts platform-specific complexities, enabling seamless sending of verification codes via WhatsApp while you focus on delivering your app's core functionalities. By leveraging WhatsApp, this plugin helps reduce reliance on traditional SMS, lowering costs and enhancing user experience. It ensures efficient delivery of OTPs directly to the user's WhatsApp account, making it a cost-effective and user-friendly solution for modern verification workflows.


**1.1 Scope of Work**
	
This solution leverages WhatsApp to optimize phone number verification costs, eliminating the need for traditional SMS and reducing expenses for OTP services and international messaging. It ensures efficient, free delivery of verification codes for both businesses and users, eliminating resource wastage and enabling businesses to maintain a sustainable and modern verification strategy. As the service is free, it creates a cost-neutral solution for all parties involved, seamlessly integrating into existing systems to enhance user experience.


**2. Purpose of the Plugin**

The WhatsApp Verification plugin simplifies the integration of WhatsApp-based OTP verification in Flutter apps, enabling businesses to implement a modern solution. It is designed to:

**1. Cost-Free Verification:** Provides a completely free solution for OTP verification, benefiting both businesses and users by eliminating expenses associated with SMS.

**2. Cross-Platform Support:** Ensures seamless functionality across devices with a single codebase, avoiding platform-specific complexities.

**3. Effortless Integration:** Allows developers to add WhatsApp-based verification features without requiring extensive knowledge of native code.

**4. Improved Efficiency:** Speeds up the implementation process, enabling rapid deployment of secure and reliable phone number verification for user authentication.



**3. Core Capabilities**

Key features of the plugin include:
• WhatsApp Integration: Seamlessly launches the native WhatsApp app with a pre-filled verification message, ensuring secure user interaction and protecting data.

• Status Callbacks: Offers real-time updates on the status of launching WhatsApp, enabling better error handling and smoother user experiences.

• Unified Codebase: Simplifies the integration process by eliminating the need for platform-specific adjustments, making OTP verification implementation more straightforward for developers.



**4.Plugin Diagram**

**Message Generation:**
• The plugin generates a pre-filled WhatsApp verification message, using the (WhatsAppUrlGenerator) class. This ensures the message includes all necessary information (e.g., OTP or verification code).

• The URL for the message is created using the (IUrlGenerationService) and parsed via the (IParsingUriService) to ensure compatibility with the WhatsApp URL scheme.

**WhatsApp Launching:**
• Once the URL is prepared, the (WhatsAppLauncherService) attempts to launch the native WhatsApp app. This opens WhatsApp directly, pre-filled with the verification message.

**Platform Support:**
•The plugin is cross-platform and works on both Android and iOS devices.

**Status Feedback:**
**• Success:** If WhatsApp launches successfully, the plugin notifies the app via a callback, enabling the user to proceed with verification.

**• Failure:** If WhatsApp fails to launch, the plugin notifies the app of the failure, prompting an error message to the user (e.g., "Failed to launch WhatsApp").

![Sending Whatsapp verification](https://github.com/user-attachments/assets/52aa634d-65ce-4f02-a505-7a67a91dbf92)

 

**5. Code Explanation**

The WhatsApp Verification plugin is structured to deliver a clean, organized, and modular approach to handling WhatsApp-based OTP verification in Flutter applications. Here’s a detailed explanation of the key components, their architecture, and functionalities included in the codebase:

**5.1Plugin Structure:**

The plugin follows a layered architecture, separating concerns into distinct modules for services, handlers, and DTOs. This modularity ensures that each component can be developed, tested, and maintained independently.

**5.1.1Core Classes:**

**• IUrlGenerationService:** This abstract class defines the core functionality for generating encoded URLs, specifically for WhatsApp messages. It ensures flexibility by allowing customization of the URL encoding process, making it adaptable for various use cases in the future.

 ![Picture1](https://github.com/user-attachments/assets/68b29e18-c5cc-4b86-9451-40147b8afab6)

**• IParsingUriService:** This abstract class defines the core functionality for parsing a given URI string into a standardized (Uri) object. It provides a flexible and modular approach to handle URI parsing, ensuring consistency and adaptability across different use cases.

 ![Picture2](https://github.com/user-attachments/assets/58e58881-ba4c-4967-9ca5-c183cf0d52a9)

**• WhatsAppUrlGenerator:** This class implements both the IUrlGenerationService and IParsingUriService interfaces, providing a unified approach for generating and parsing WhatsApp URLs. It offers:

**• _generateWhatsappUrl:** A private method that constructs a complete WhatsApp URL by combining the phone number and a pre-encoded message.

**• generateUri:** A public method that generates a URI by parsing the constructed WhatsApp URL for seamless usage.

**• encodedUrl:** Encodes the message text to ensure proper URL formatting.

**• parseUri:** Parses a given URL string into a Uri object for consistent handling.
 
![Picture3](https://github.com/user-attachments/assets/48570b4a-b5f5-4842-90f4-3087d8d62bac)

**• WhatsAppSendingResultDto:** A DTO that represents the result of a WhatsApp message operation.
**• Properties:**
	**• launchingStatus:** Indicates if WhatsApp was successfully launched.
	**• message:** Contains the success or error message.

**• toMap Method:** Serializes the object into a map for easy storage or transmission.

 ![Picture4](https://github.com/user-attachments/assets/a6a7b245-d6a6-43ae-9d20-629d3791f647)





**5.1.2 WhatsApp Messaging Handler:**

**• WhatsAppMessageResultHandler:** A handler class for processing WhatsApp message operation results.
**• callbackResultHandler Method:** Converts a WhatsAppSendingResultDto into a map for further processing or callback handling.
**• SendingMessageResultCallback:** A typedef for the callback function that handles the result map.

![Picture5](https://github.com/user-attachments/assets/8f50d5e9-4f3e-4602-a518-e65e3c591730)

**• IWhatsappLauncherService:** An abstract interface for launching WhatsApp with a pre-filled message.

**• launch Method:** This method defines the contract for launching WhatsApp with a specified message and phone number. It requires a callback function to handle the result of the operation.

 ![Picture6](https://github.com/user-attachments/assets/bbd6f8b5-6d9f-40db-86f0-bfc9d17ee858)


**• WhatsappLauncherService: A service responsible for launching WhatsApp with a pre-filled message.
• Implements the IWhatsappLauncherService interface.
• Uses the WhatsAppUrlGenerator to create the deep link and attempts to launch WhatsApp.
• Returns the result via a callback function, using the WhatsAppMessageResultHandler to process the result.
• Handles errors gracefully by invoking the callback with a failure message if launching WhatsApp fails.

 ![Picture7](https://github.com/user-attachments/assets/a9b6f0f9-ff68-49b4-9d3f-4405f6d4299b)


**5.1.3 Factory Design Pattern:**

**• WhatsappSendingMessageFactory:** A factory class for creating and configuring instances of WhatsappSendingMessage.
• Provides a static create method to initialize WhatsappSendingMessage with its required dependencies, such as WhatsappLauncherService.
• Promotes separation of concerns and ensures better testability by encapsulating the setup process for WhatsApp messaging functionality.
• Returns a fully configured WhatsappSendingMessage instance, ready for handling WhatsApp-based actions.

![Picture8](https://github.com/user-attachments/assets/dd035c6a-39a7-40e0-9c5a-7e9e322e82ba)




**5.1.4 Singleton Design Pattern:**

**WhatsappSendingMessage:** The central class for managing WhatsApp messaging operations.
• Implements a singleton pattern to ensure only one instance is created and used throughout the application.

**• Dependencies:** Includes a WhatsappLauncherService to handle WhatsApp deep linking and messaging actions.

**• Initialization:** Provides an initialize method to inject the WhatsappLauncherService dependency.

**• Core Functionality:** Offers sendingVerificationMessageViaWhatsApp to send a verification message via WhatsApp, taking the message, recipient’s phone number, and a callback to handle the result.

![Picture9](https://github.com/user-attachments/assets/7541c8bc-689e-4430-826d-095ae4211254)


 
**6. Example of Usage**

Integrating the WhatsApp-based Verification plugin into your Flutter application is straightforward. Below is a step-by-step guide on how to set up and use the plugin for sending verification messages.

**Step 1: Add Android Permissions:**
First, add uses-Permissions to your AndroidManifest.xml file:

 ![Picture10](https://github.com/user-attachments/assets/ceb0303b-bc21-48f2-8498-369153fe5bda)

**Step 2: Add Dependency:**
Add the plugin to your pubspec.yaml file:

 ![Picture11](https://github.com/user-attachments/assets/f391fd61-ac56-4044-8cab-bba9ac4dcb4e)

Make sure to run **flutter pub get** to install the package.

**Step 3: Import the Plugin:**
In your Dart file, import the plugin:

![Picture12](https://github.com/user-attachments/assets/21efee03-1bce-408b-9352-4c3b781a37a9)
 
**Step 4: Send verification message:**
To send a Verification message via WhatsApp, use the whatsappSendingMessageService class. Here’s how you can send a verification message using the plugin: 

 ![Picture13](https://github.com/user-attachments/assets/53abd1b8-1096-4346-a36e-5df9a37acaf5)





**Step 6: Handling Results**
The callback function in the verifyMessage method provides a result map, which contains the status of the WhatsApp launching operation and a launching message body. You can use this information to manage the results effectively in your application.

![Picture14](https://github.com/user-attachments/assets/f296f002-627c-48ec-b98e-4c72c9e67a5c)



**7.Conclusion**

The WhatsApp Messaging Service framework is an essential tool for applications aiming to streamline WhatsApp-based communication. By providing a structured approach to deep linking and message operations, the service simplifies the integration of WhatsApp functionality, enabling developers to focus on enhancing user experience. With its adherence to clean code principles and the SOLID architecture, the framework ensures maintainability and scalability. By leveraging this solution, businesses can efficiently send verification messages and engage users through a familiar platform, ensuring seamless communication while minimizing development complexity.
