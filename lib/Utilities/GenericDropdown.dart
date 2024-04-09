import 'package:flutter/material.dart';

import 'colors.dart';

class GenericDropdown<T> extends StatefulWidget {
  final List<T> options;
  final T selectedValue;
  final ValueChanged<T?>? onChanged;

  GenericDropdown({
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  _GenericDropdownState<T> createState() => _GenericDropdownState<T>();
}

class _GenericDropdownState<T> extends State<GenericDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: widget.selectedValue,
      onChanged: widget.onChanged,
      style: TextStyle(
        fontSize: 16,
        color: button,
      ),
      dropdownColor: Colors.white,
      iconEnabledColor: button,
      iconDisabledColor: button,
      items: widget.options.map((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: SizedBox(
            width: MediaQuery.of(context).size.width /2.3,
            child: Text(
              value.toString(),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
