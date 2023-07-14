import 'package:deriv_adapters_plugins/deriv_adapters_plugins.dart';
import 'package:flutter/material.dart';

class ActiveSymbolWidget extends StatelessWidget {
  const ActiveSymbolWidget({
    required this.activeSymbols,
    this.selectedActiveSymbol,
    this.onChanged,
    super.key,
  });

  final List<ActiveSymbolEntity> activeSymbols;
  final ActiveSymbolEntity? selectedActiveSymbol;
  final void Function(ActiveSymbolEntity entity)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton<ActiveSymbolEntity>(
        isExpanded: true,
        underline: Container(),
        value: selectedActiveSymbol,
        items: activeSymbols
            .map(
              (ActiveSymbolEntity activeSymbol) =>
                  DropdownMenuItem<ActiveSymbolEntity>(
                value: activeSymbol,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    activeSymbol.symbolDisplayName,
                    style: TextStyle(
                      fontWeight: _isSelected(activeSymbol)
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (ActiveSymbolEntity? activeSymbol) =>
            onChanged?.call(activeSymbol!),
      ),
    );
  }

  bool _isSelected(ActiveSymbolEntity activeSymbol) =>
      activeSymbol == selectedActiveSymbol;
}
