import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_proxy/flutter_proxy.dart';
import 'package:flutter_proxy/flutter_proxy_platform_interface.dart';
import 'package:flutter_proxy/flutter_proxy_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterProxyPlatform
    with MockPlatformInterfaceMixin
    implements FlutterProxyPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterProxyPlatform initialPlatform = FlutterProxyPlatform.instance;

  test('$MethodChannelFlutterProxy is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterProxy>());
  });

  test('getPlatformVersion', () async {
    FlutterProxy flutterProxyPlugin = FlutterProxy();
    MockFlutterProxyPlatform fakePlatform = MockFlutterProxyPlatform();
    FlutterProxyPlatform.instance = fakePlatform;

    expect(await flutterProxyPlugin.getPlatformVersion(), '42');
  });
}
