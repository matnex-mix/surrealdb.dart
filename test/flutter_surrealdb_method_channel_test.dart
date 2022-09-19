import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_surrealdb/flutter_surrealdb_method_channel.dart';

void main() {
  MethodChannelFlutterSurrealdb platform = MethodChannelFlutterSurrealdb();
  const MethodChannel channel = MethodChannel('flutter_surrealdb');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
