import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core_plugin_arch_poc/features/connectivity/data/base.connectivity.datasource.dart';

final class ConnectivityDataSource extends BaseConnectivityDataSource {
  @override
  Stream<bool> fetchConnectivityStream() =>
      Connectivity().onConnectivityChanged.asyncMap(
        (ConnectivityResult resut) async {
          final bool isConnected = resut == ConnectivityResult.mobile ||
              resut == ConnectivityResult.wifi;

          if (isConnected) {
            final connectivityResult = await _lookupInternet();
            return connectivityResult;
          } else {
            return false;
          }
        },
      );

  Future<bool> _lookupInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}
