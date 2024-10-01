import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/constants/assets.dart';

import 'package:flutter/material.dart';

class ImageDisplayWidget extends StatelessWidget {
  final String? imageUrl;
  final String? assetPath;
  final double radius;
  final double size;
  final bool isShow;

  const ImageDisplayWidget({
    Key? key,
    this.imageUrl,
    this.assetPath,
    this.radius = 100.0,
    this.size = 100.0,
    this.isShow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageDecoration = _getImageDecoration();

    return GestureDetector(
      onTap: () => isShow ? _showImageDialog(context) : null,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).dividerColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(radius),
          image: imageDecoration,
        ),
        child: imageDecoration == null ? _getChildWidget(context) : null,
      ),
    );
  }

  DecorationImage? _getImageDecoration() {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return DecorationImage(
        image: NetworkImage(imageUrl!),
        fit: BoxFit.cover,
      );
    } else if (assetPath != null && assetPath!.isNotEmpty) {
      return DecorationImage(
        image: AssetImage(assetPath!),
        fit: BoxFit.cover,
      );
    }
    return null; // در صورت نبودن عکس، مقدار null برمی‌گردد تا آیکون نمایش داده شود.
  }

  Widget _getChildWidget(BuildContext context) {
    // در صورتی که هیچ عکسی وجود نداشت، آیکون گالری نمایش داده می‌شود.
    return Center(
      child: Icon(
        Icons.photo_library, // از آیکون گالری استفاده شده
        color: Theme.of(context).iconTheme.color!.withOpacity(0.2),
        size: size / 1.7,
      ),
    );
  }

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          child: _buildImageDialogContent(context),
        );
      },
    );
  }

  Widget _buildImageDialogContent(BuildContext context) {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return InteractiveViewer(
        child: Image.network(
          imageUrl!,
          fit: BoxFit.contain, // تصویر با نسبت ابعاد واقعی نمایش داده می‌شود
        ),
      );
    } else if (assetPath != null && assetPath!.isNotEmpty) {
      return InteractiveViewer(
        child: Image.asset(
          assetPath!,
          fit: BoxFit.contain, // تصویر از asset با نسبت واقعی نمایش داده می‌شود
        ),
      );
    } else {
      return Container(
        width: 350,
        height: 350,
        alignment: Alignment.center,
        child: Icon(
          Icons.photo_library,
          color: Theme.of(context).iconTheme.color!.withOpacity(0.2),
          size: 100,
        ),
      );
    }
  }
}
