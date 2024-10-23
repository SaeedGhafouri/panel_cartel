import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:panel_cartel/core/widgets/image_diplay_widget.dart';

import '../../data/models/product_model.dart';

class ItemCardWidget extends StatefulWidget {
  final Product product;
  const ItemCardWidget({
    super.key,
    required this.product,
  });

  @override
  State<ItemCardWidget> createState() => _ItemCardWidgetState();
}

class _ItemCardWidgetState extends State<ItemCardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    Product product = widget.product;
    return MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: smallRadius,
              side:
                  BorderSide(width: 1, color: Theme.of(context).dividerColor)),
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: padding_20,
            child: Column(
              children: [
                ImageDisplayWidget(
                  size: 150,
                  radius: radiusSmall,
                  imageUrl: product.image,
                ),
                const SizedBox(height: spacingSmall),
                Column(
                  children: [
                    Text(
                      product.name!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: spacingThin),
                    Text(
                      product.brand!,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: spacingThin),
                    Text(
                      product.category.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const SizedBox(height: spacingThin),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.price.toString() ?? '0.0',
                          style:
                          Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(width: 3,),
                        Text(
                          'ریال',
                          style:
                          Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    if (_isHovered)
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: smallRadius,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      IconsaxPlusLinear.eye,
                                      size: 20,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      IconsaxPlusLinear.edit_2,
                                      size: 20,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      IconsaxPlusLinear.trash,
                                      color: dangerColor,
                                      size: 20,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
