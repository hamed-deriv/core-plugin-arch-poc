import 'package:bloc/bloc.dart';
import 'package:kafka_clone/shelf.dart';
import 'package:meta/meta.dart';
import 'package:core_plugin_arch_poc/features/connectivity/adapter-plugin/adapters/connectivity.adapter.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> with ProducerMixin {
  ConnectivityCubit(this._plugin) : super(ConnectivityConnected()) {
    _startListening();
  }

  final ConnectivityAdapter _plugin;

  void _startListening() {
    _plugin.fetchConnectivityStream().listen((bool connectionState) async {
      if (connectionState == true) {
        emit(ConnectivityConnected());
        sendMessage('Connection', 'Connected');
      } else {
        emit(ConnectivityDisconnected());
        sendMessage('Connection', 'Disconnected');
      }
    });
  }
}
