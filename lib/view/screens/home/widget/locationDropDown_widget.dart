// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LocationDropdown extends StatelessWidget {
  final String? selectedGovernorate;
  final List<String> governorates;
  final ValueChanged<String?> onChanged;

  const LocationDropdown({
    super.key,
    required this.selectedGovernorate,
    required this.governorates,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        IntrinsicWidth(
          child: DropdownButtonFormField<String>(
            value: selectedGovernorate,
            decoration: const InputDecoration(
              hintText: "Select Governorate",
              border: InputBorder.none,
              isDense: true,
            ),
            items: governorates
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
