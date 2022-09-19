import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_surrealdb_platform_interface.dart';

/// An implementation of [FlutterSurrealdbPlatform] that uses method channels.
class MethodChannelFlutterSurrealdb extends FlutterSurrealdbPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_surrealdb');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
