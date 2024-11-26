import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:octo_image/octo_image.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:panel_cartel/core/utils/toast.dart';
import 'package:panel_cartel/core/widgets/commadbar_widget.dart';
import '../utils/file_downloader.dart';

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
    return GestureDetector(
      onTap: () => isShow ? _showImageDialog(context) : null,
      child: Container(
        width: size ?? 45,
        height: size ?? 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0)
        ),
        child: OctoImage.fromSet(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl!),
          fadeInDuration: Duration(seconds: 1),
          octoSet: OctoSet.circularIndicatorAndIcon(showProgress: true),
        ),
      ),
    );
  }

  void _showImageDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.transparent,
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        final screenSize = MediaQuery.of(context).size;
        return Center(
          child: ClipRRect(
            borderRadius: smallRadius,
            child: Container(
              width: screenSize.width * 0.3,
              height: screenSize.height * 0.6,
              decoration: BoxDecoration(
                borderRadius: smallRadius,
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: _buildImageDialogContent(context),
                  ),
                  Padding(
                    padding: padding_20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommadbarWidget(
                          text: 'دریافت',
                          icon: IconsaxPlusLinear.arrow_down_1,
                          onPressed: () async {
                            final downloader = FileDownloader();
                            try {
                              final filePath = await downloader.downloadFile(
                                url: imageUrl!, fileName: 'Admin of Cartel'
                              );
                              print('File downloaded to: ');
                              showToast(context: context, message: 'تصویر با موفقیت دریافت شد: $filePath', type: ToastType.success);
                            } catch (e) {
                              showToast(context: context, message: 'خطایی رخ داده است');
                              print(e);
                            }
                          },
                        ),
                        CommadbarWidget(
                          text: 'بستن',
                          icon: IconsaxPlusLinear.close_circle,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }



// Example image widget

  Widget _buildImageDialogContent(BuildContext context) {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return InteractiveViewer(
          child: OctoImage.fromSet(
        fit: BoxFit.cover,
        image: NetworkImage(imageUrl!),
        fadeInDuration: Duration(seconds: 1),
        octoSet: OctoSet.circularIndicatorAndIcon(showProgress: true),
      ));
    } else if (assetPath != null && assetPath!.isNotEmpty) {
      return InteractiveViewer(
        child: OctoImage.fromSet(
          fit: BoxFit.cover,
          image: AssetImage(assetPath!),
          fadeInDuration: Duration(seconds: 1),
          octoSet: OctoSet.circularIndicatorAndIcon(
            showProgress: true,
          ),
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
