import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../themes/themes.dart';

class ProgressWidget extends StatefulWidget {
  final bool? isButton;

  const ProgressWidget({super.key, this.isButton});
  @override
  _ProgressWidget createState() => _ProgressWidget();
}

class _ProgressWidget extends State<ProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightBtnMain,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: mediumRadius,
      ),
      child: widget.isButton!
          ? LoadingAnimationWidget.staggeredDotsWave(
              color: Theme.of(context).primaryColor,
              size: 45,
            )
          : LoadingAnimationWidget.staggeredDotsWave(
              color: Theme.of(context).primaryColor,
              size: 50,
          )
      );
  }
}