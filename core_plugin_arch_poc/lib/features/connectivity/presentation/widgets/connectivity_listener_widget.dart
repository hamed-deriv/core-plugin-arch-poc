import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_plugin_arch_poc/core/navigation/navigator_service.dart';
import 'package:core_plugin_arch_poc/features/connectivity/app/cubit/connectivity_cubit.dart';
import 'package:core_plugin_arch_poc/features/connectivity/presentation/widgets/connection_dialog.dart';

class ConnectivityListenerWidget extends StatelessWidget {
  const ConnectivityListenerWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) => switch (state) {
        ConnectivityConnected() => NavigatorService.pop(context),
        ConnectivityDisconnected() => showDialog(
            context: context,
            builder: (context) => const ConnectionDialog(),
          ),
      },
      child: child,
    );
  }
}
