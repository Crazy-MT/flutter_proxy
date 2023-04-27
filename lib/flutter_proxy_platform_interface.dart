import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_proxy_method_channel.dart';

abstract class FlutterProxyPlatform extends PlatformInterface {
  /// Constructs a FlutterProxyPlatform.
  FlutterProxyPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterProxyPlatform _instance = MethodChannelFlutterProxy();

  /// The default instance of [FlutterProxyPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterProxy].
  static FlutterProxyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterProxyPlatform] when
  /// they register themselves.
  static set instance(FlutterProxyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getSystemProxy() {
    throw UnimplementedError('systemProxy() has not been implemented.');
  }
}
