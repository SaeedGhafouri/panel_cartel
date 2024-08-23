import 'package:flutter/material.dart';

class ImageDisplayWidget extends StatelessWidget {
  final String? imageUrl;
  final String? assetPath;
  final double radius;
  final double size;

  const ImageDisplayWidget({
    Key? key,
    this.imageUrl,
    this.assetPath,
    this.radius = 100.0,
    this.size = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showImageDialog(context),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(radius),
          image: _getImageDecoration(),
        ),
        child: _getChildWidget(),
      ),
    );
  }

  DecorationImage? _getImageDecoration() {
    if (imageUrl != null) {
      return DecorationImage(
        image: NetworkImage(imageUrl!),
        fit: BoxFit.cover,
      );
    } else if (assetPath != null) {
      return DecorationImage(
        image: AssetImage(assetPath!),
        fit: BoxFit.cover,
      );
    }
    return null;
  }

  Widget? _getChildWidget() {
    if (imageUrl == null && assetPath == null) {
      return Center(
        child: Icon(
          Icons.image,
          color: Colors.grey,
          size: size / 2,
        ),
      );
    }
    return null;
  }

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              image: _getImageDecoration(),
              borderRadius: BorderRadius.circular(7)
            ),
            child: _getChildWidget(),
          ),
        );
      },
    );
  }
}
