
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../core/widgets/commadbar_main.dart';

class StatusPopupWidget extends StatefulWidget {
  @override
  _StatusPopupWidgetState createState() => _StatusPopupWidgetState();
}

class _StatusPopupWidgetState extends State<StatusPopupWidget> {
  void _showStatusPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(textDirection: TextDirection.rtl, child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          title: Text('انتخاب وضعیت سفارش', style: Theme.of(context).textTheme.titleSmall,),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildStatusOption(context, 'در حال پردازش', IconsaxPlusLinear.refresh_2, () {
                  Navigator.pop(context);
                }),
                _buildStatusOption(context, 'ارسال شد', IconsaxPlusLinear.truck_fast, () {
                  Navigator.pop(context);
                }),
                _buildStatusOption(context, 'تحویل داده شد', IconsaxPlusLinear.tick_circle, () {
                  Navigator.pop(context);
                }),
                _buildStatusOption(context, 'لغو شد', IconsaxPlusLinear.close_circle, () {
                  Navigator.pop(context);
                }),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('بستن', style: Theme.of(context).textTheme.bodyMedium),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
      },
    );
  }

  Widget _buildStatusOption(BuildContext context, String status, IconData icon, VoidCallback onPressed) {
    return ListTile(
      leading: Icon(icon, size: 20,),
      title: Text(status, style: Theme.of(context).textTheme.bodyMedium,),
      onTap: onPressed,
    );
  }
  @override
  Widget build(BuildContext context) {
    return CommadbarWidget(
      text: 'وضعیت',
      icon: IconsaxPlusLinear.quote_up_square,
      onPressed: () {
        _showStatusPopup(context);
      },
    );
  }
}