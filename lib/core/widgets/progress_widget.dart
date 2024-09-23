import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../themes/themes.dart';

class ProgressWidget extends StatefulWidget {

  const ProgressWidget({super.key});
  @override
  _ProgressWidget createState() => _ProgressWidget();
}

class _ProgressWidget extends State<ProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: heightBtnMain,
        decoration: BoxDecoration(
          borderRadius: mediumRadius,
        ),
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: Theme.of(context).primaryColor,
          size: 45,
        ));
  }
}
