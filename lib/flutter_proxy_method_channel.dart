import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_proxy_platform_interface.dart';

/// An implementation of [FlutterProxyPlatform] that uses method channels.
class MethodChannelFlutterProxy extends FlutterProxyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_proxy');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getSystemProxy() async {
    final version = await methodChannel.invokeMethod<String>('getSystemProxy');
    return version;
  }
}
