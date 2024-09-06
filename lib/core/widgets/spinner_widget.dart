
import 'package:flutter/material.dart';

import '../constants/assets.dart';
import '../themes/themes.dart';

class SpinnerWidget extends StatefulWidget {
  final String? label;
  final List<String> items;
  final String? selectedItem;
  final void Function(String?)? onChanged;
  final double width;

  SpinnerWidget({
    required this.items,
    this.label,
    this.selectedItem,
    this.onChanged,
    this.width = 200,
  });

  @override
  _SpinnerWidget createState() => _SpinnerWidget();
}

class _SpinnerWidget extends State<SpinnerWidget> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: widget.width,
          height: heightFieldMain,
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
              icon: Icon(Icons.arrow_drop_down),
              style: Theme.of(context).textTheme.bodySmall,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(newValue);
                }
              },
              borderRadius: smallRadius,
              hint: Text(
                widget.label!,
                style: TextStyle(
                  fontFamily: font_regular
                ),
              ),
              items: widget.items
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, textDirection: TextDirection.ltr,),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
