import 'package:flutter/material.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/domain/entities/active_symbol_entity.dart';

class ActiveSymbolDropDown extends StatefulWidget {
  const ActiveSymbolDropDown({
    required this.activeSymbols,
    this.onChanged,
    super.key,
  });

  final List<ActiveSymbolEntity> activeSymbols;
  final void Function(ActiveSymbolEntity entity)? onChanged;

  @override
  State<ActiveSymbolDropDown> createState() => _ActiveSymbolDropDownState();
}

class _ActiveSymbolDropDownState extends State<ActiveSymbolDropDown> {
  ActiveSymbolEntity? _selectedActiveSymbol;
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
        value: _selectedActiveSymbol,
        items: widget.activeSymbols
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
        onChanged: (ActiveSymbolEntity? activeSymbol) {
          widget.onChanged?.call(activeSymbol!);
          setState(() {
            _selectedActiveSymbol = activeSymbol;
          });
        },
      ),
    );
  }

  bool _isSelected(ActiveSymbolEntity activeSymbol) =>
      activeSymbol == _selectedActiveSymbol;
}
