import 'package:core_plugin_arch_poc/core/application/messageing_interface.dart';

abstract interface class TickStreamMessagingInterface
    extends BaseMessagingInterface {
  void forgetTickStream();
  String getLatestChosenSymbol();
  void listenToRPCMessages({
    required Function onForgetTickStreamRequested,
  });

  void subscribeToSymbolStream({
    required Function(String) onSymbolChanged,
  });

  void unSubscribeFromSymbolStream();

  void unSubscribeFromRPCStream();
}
