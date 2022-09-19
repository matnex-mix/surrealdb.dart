import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_surrealdb_method_channel.dart';

abstract class FlutterSurrealdbPlatform extends PlatformInterface {
  /// Constructs a FlutterSurrealdbPlatform.
  FlutterSurrealdbPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterSurrealdbPlatform _instance = MethodChannelFlutterSurrealdb();

  /// The default instance of [FlutterSurrealdbPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterSurrealdb].
  static FlutterSurrealdbPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterSurrealdbPlatform] when
  /// they register themselves.
  static set instance(FlutterSurrealdbPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
