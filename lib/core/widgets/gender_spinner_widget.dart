
import 'package:flutter/material.dart';
import '../constants/assets.dart';
import '../themes/themes.dart';
class GenderSpinnerWidget extends StatefulWidget {
  final String? selectedItem;
  final void Function(int?)? onChanged;
  final double? width;
  final String? errorText;

  const GenderSpinnerWidget({
    super.key,
    this.selectedItem,
    this.onChanged,
    this.width,
    this.errorText,
  });

  @override
  State<GenderSpinnerWidget> createState() => _GenderSpinnerWidgetState();
}

class _GenderSpinnerWidgetState extends State<GenderSpinnerWidget> {
  String? selectedValue;
  final List<String> items = [
    'مرد',
    'زن',
    'نامشخص',
  ];

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedItem;
  }

  int? _getGenderValue(String? value) {
    switch (value) {
      case 'مرد':
        return 1;
      case 'زن':
        return 2;
      case 'نامشخص':
        return 0;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: widget.width,
          height: heightBtnMain,
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            borderRadius: smallRadius,
            color: Theme.of(context).cardColor,
            border: Border.all(
              color: Theme.of(context).dividerColor,
              width: 1.0,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down),
              style: Theme.of(context).textTheme.bodySmall,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });

                if (widget.onChanged != null) {
                  widget.onChanged!(_getGenderValue(newValue));
                }
              },
              borderRadius: smallRadius,
              hint: const Text(
                'جنسیت',
                style: TextStyle(
                  fontFamily: font_regular,
                ),
              ),
              items: items
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
