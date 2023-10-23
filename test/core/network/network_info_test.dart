import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/network/network_info.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockConnectivity mockConnectivity;
  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfoImpl = NetworkInfoImpl(connectivity: mockConnectivity);
  });

  group('isConnected', () {
    test(
        'must call the DataConnectionChecker.hasConnection function and the connection is connected to the internet (online)',
        () async {
      const connectionFuture = ConnectivityResult.mobile;
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((realInvocation) async => connectionFuture);
      final result = await networkInfoImpl.isConnected;

      verify(mockConnectivity.checkConnectivity());
      expect(result, connectionFuture != ConnectivityResult.none);
    });
  });

  test('should return false if ConnectivityResult is none', () async {
    const connectionFuture = ConnectivityResult.none;
    when(mockConnectivity.checkConnectivity())
        .thenAnswer((realInvocation) async => connectionFuture);
    final result = await networkInfoImpl.isConnected;

    verify(mockConnectivity.checkConnectivity());
    expect(result, false);
  });
}
