import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'commadbar_widget.dart';
import 'image_diplay_widget.dart';

class ActionPopupWidget extends StatelessWidget {
  final Function()? onDelete;
  final Function()? onUpdate;
  final Function()? onShow;
  const ActionPopupWidget({
    Key? key,
    this.onDelete,
    this.onUpdate,
    this.onShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Theme.of(context).cardColor,
      position: PopupMenuPosition.under,

      itemBuilder: (BuildContext context) {
        return [
          if (onShow != null) ...[
            PopupMenuItem<String>(
                value: 'show',
                onTap: onShow ?? () {},
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    'مشاهده',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    IconsaxPlusLinear.eye,
                    color: Theme.of(context).iconTheme.color,
                    size: 17,
                  ),
                ]))
          ],
          if (onUpdate != null) ...[
            PopupMenuItem<String>(
                value: 'update',
                onTap: onUpdate ?? () {},
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    'ویرایش',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    IconsaxPlusLinear.edit,
                    color: Theme.of(context).iconTheme.color,
                    size: 17,
                  ),
                ]))
          ],
          if (onDelete != null) ...[
            PopupMenuItem<String>(
              value: 'delete',
              onTap: onDelete ?? () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'حذف',
                    style: TextStyle(fontSize: txt_20, color: dangerColor),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    IconsaxPlusLinear.trash,
                    color: Colors.redAccent,
                    size: 17,
                  ),
                ],
              ),
            ),
          ],
        ];
      },
      child: Tooltip(
        message: 'کنترلر آیتم',
        child: Icon(IconsaxPlusLinear.more, color: Theme.of(context).textTheme.headlineSmall!.color,),
      ),
    );
  }
}
