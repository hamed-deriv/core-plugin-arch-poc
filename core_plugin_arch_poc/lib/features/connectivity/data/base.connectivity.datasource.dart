import 'package:core_plugin_arch_poc/core/data/base.data.dart';

abstract base class BaseConnectivityDataSource extends BaseDataSource {
  Stream<bool> fetchConnectivityStream();
}
