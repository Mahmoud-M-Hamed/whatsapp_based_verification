import 'package:flutter_test/flutter_test.dart';
import 'package:whatsapp_based_verification/whatsapp_based_verification.dart';
import 'package:whatsapp_based_verification/whatsapp_based_verification_platform_interface.dart';
import 'package:whatsapp_based_verification/whatsapp_based_verification_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWhatsappBasedVerificationPlatform
    with MockPlatformInterfaceMixin
    implements WhatsappBasedVerificationPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WhatsappBasedVerificationPlatform initialPlatform = WhatsappBasedVerificationPlatform.instance;

  test('$MethodChannelWhatsappBasedVerification is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWhatsappBasedVerification>());
  });

  test('getPlatformVersion', () async {
    WhatsappBasedVerification whatsappBasedVerificationPlugin = WhatsappBasedVerification();
    MockWhatsappBasedVerificationPlatform fakePlatform = MockWhatsappBasedVerificationPlatform();
    WhatsappBasedVerificationPlatform.instance = fakePlatform;

    expect(await whatsappBasedVerificationPlugin.getPlatformVersion(), '42');
  });
}
