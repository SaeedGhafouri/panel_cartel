import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/constants/assets.dart';

class SearchFieldWidget extends StatelessWidget {
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
      width: 300,
      height: 40,
      child: Row(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(IconsaxPlusLinear.search_normal, size: 15, color: Theme.of(context).textTheme.headlineSmall!.color, ),
          ),
          Expanded(
            child: TextField(
              style: Theme.of(context).textTheme.labelMedium,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'جستجو',
                  hintStyle: Theme.of(context).textTheme.headlineSmall
              ),
            ),
          )

        ],
      )
    );
  }
}