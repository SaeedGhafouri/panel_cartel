import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class SearchFieldWidget extends StatelessWidget {
  // controller
  final TextEditingController controller;
  final Function()? action;

  const SearchFieldWidget(
      {Key? key, required this.controller, this.action})
      : super(key: key);

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
            Expanded(
              child: SearchBar(
                onTap: () => action?.call(),
                  controller: controller,
                  onSubmitted: (value) => action?.call(),
                  hintText: 'جستجو',
                  textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.titleMedium),
                  hintStyle: MaterialStateProperty.all(TextStyle(
                      color: Theme.of(context).textTheme.headlineSmall!.color)),
                  leading: Icon(
                    IconsaxPlusLinear.search_normal,
                    size: 15,
                    color: Theme.of(context).textTheme.headlineSmall!.color,
                  ),
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).cardColor),
                  shape: MaterialStateProperty.all(

                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
            )
          ],
        ));
  }
}

