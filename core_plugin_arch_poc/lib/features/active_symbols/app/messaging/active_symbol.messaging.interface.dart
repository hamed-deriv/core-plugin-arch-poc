import 'package:core_plugin_arch_poc/core/application/messageing_interface.dart';

abstract interface class ActiveSymbolMessagingInterface
    extends BaseMessagingInterface {
  void updateChosenSymbol(String symbol);
  String fetchLatestChosenSymbol();
}
