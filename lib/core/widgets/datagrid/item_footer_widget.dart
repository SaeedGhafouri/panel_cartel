import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:number_paginator/number_paginator.dart';

class ItemFooterWidget extends StatefulWidget {
  final int? numberPages;
  final int? initialPage;
  final Function(int)? onPageChanged;
  final int? total;
  const ItemFooterWidget(
      {super.key, this.numberPages, this.initialPage, this.onPageChanged, this.total});

  @override
  State<ItemFooterWidget> createState() => _ItemFooterWidgetState();
}

class _ItemFooterWidgetState extends State<ItemFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Text(
              'درحال نمایش ${widget.initialPage! * 10} از ${widget.total}',
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            flex: 4,
              child: NumberPaginator(
                  numberPages: widget.numberPages!,
                  initialPage: widget.initialPage!,
                  onPageChange: (index) {
                    widget.onPageChanged!(index);
                  },
              )
          )
        ],
      ),
    );
  }
}
