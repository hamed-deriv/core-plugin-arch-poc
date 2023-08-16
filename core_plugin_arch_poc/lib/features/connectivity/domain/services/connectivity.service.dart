import 'package:core_plugin_arch_poc/core/domain/base.domain.dart';

abstract interface class ConnectivityService extends BaseService {
  Stream<bool> fetchConnectivityStream();
}
