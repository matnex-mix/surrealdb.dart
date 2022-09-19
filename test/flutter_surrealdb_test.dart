import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_surrealdb/flutter_surrealdb.dart';
import 'package:flutter_surrealdb/flutter_surrealdb_platform_interface.dart';
import 'package:flutter_surrealdb/flutter_surrealdb_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterSurrealdbPlatform 
    with MockPlatformInterfaceMixin
    implements FlutterSurrealdbPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterSurrealdbPlatform initialPlatform = FlutterSurrealdbPlatform.instance;

  test('$MethodChannelFlutterSurrealdb is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterSurrealdb>());
  });

  test('getPlatformVersion', () async {
    FlutterSurrealdb flutterSurrealdbPlugin = FlutterSurrealdb();
    MockFlutterSurrealdbPlatform fakePlatform = MockFlutterSurrealdbPlatform();
    FlutterSurrealdbPlatform.instance = fakePlatform;
  
    expect(await flutterSurrealdbPlugin.getPlatformVersion(), '42');
  });
}
