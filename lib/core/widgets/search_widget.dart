import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/constants/assets.dart';

class SearchFieldWidget extends StatelessWidget {
  //controller
  final TextEditingController controller;
  final void Function()? onPressed;

  const SearchFieldWidget({Key? key, required this.controller, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      height: 40, width: 300,
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(IconsaxPlusLinear.search_normal, size: 17, ),
          ),
          Expanded(
            child: TextField(
              style: Theme.of(context).textTheme.labelMedium,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              controller: controller,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'جستجو',
                  hintStyle: Theme.of(context).textTheme.labelSmall
              ),
            ),
          )

        ],
      )
    );
  }
}