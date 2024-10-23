
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:panel_cartel/core/widgets/image_diplay_widget.dart';

import '../../constants/assets.dart';
import '../../themes/themes.dart';

import 'package:shamsi_date/shamsi_date.dart';
import 'package:flutter/material.dart';

class TableColumnWidget extends StatelessWidget {
  final List<dynamic>? values;
  final List<Widget>? actions;
  final double height;

  const TableColumnWidget({
    Key? key,
    required this.values,
    this.actions,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          FocusScope(
            node: FocusScopeNode(),
            child: Container(
              height: height + 10,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (actions != null && actions!.isNotEmpty)
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: actions!,
                      ),
                    ),
                  if (values != null && values!.isNotEmpty)
                    ...values!.map((value) {
                      return Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: _buildCell(value, context),
                        ),
                      );
                    }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCell(dynamic value, BuildContext context) {

    if (value is String && value.startsWith('http')) {
      return ImageDisplayWidget(
        imageUrl: value,
        isShow: true,
      );
    } else if (value is List && _isCategory(value)) {
      // دسته‌بندی‌ها
      return _buildCategoryChips(value, context);
    } else if (value is String && _isEmail(value)) {
      // ایمیل
      return _buildTextCell(value, context, TextAlign.center);
    } else if (value is String && _isPhoneNumber(value)) {
      // موبایل
      return _buildTextCell(value, context, TextAlign.center);
    } else if (value is int && _isStatus(value)) {
      // وضعیت
      return _buildStatusCell(value, context);
    } else if (value is String && _isDateString(value)) {
      // تاریخ شمسی
      return _buildShamsiDate(DateTime.parse(value), context);
    } else {
      // متن پیش‌فرض برای انواع دیگر
      return _buildTextCell(value.toString(), context, TextAlign.center);
    }
  }

  bool _isEmail(String value) {
    return value.contains('@');
  }

  bool _isPhoneNumber(String value) {
    return value.length == 11 && value.startsWith('09');
  }

  bool _isCategory(dynamic value) {
    return value is List<dynamic>;
  }

  bool _isStatus(int value) {
    return value == 0 || value == 1 || value == 2;
  }

  bool _isDateString(String value) {
    try {
      DateTime.parse(value);
      return true;
    } catch (e) {
      return false;
    }
  }

  Widget _buildStatusCell(int status, BuildContext context) {
    String statusText;
    Color statusColor;

    switch (status) {
      case 0:
        statusText = 'غیرفعال';
        statusColor = Colors.red;
        break;
      case 1:
        statusText = 'فعال';
        statusColor = Colors.green;
        break;
      case 2:
        statusText = 'تعلیق';
        statusColor = Colors.orange;
        break;
      default:
        statusText = 'نامشخص';
        statusColor = Colors.grey;
    }

    return Text(
      statusText,
      style: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(color: statusColor),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildShamsiDate(DateTime dateTime, BuildContext context) {
    final jalaliDate = Jalali.fromDateTime(dateTime);

    return Text(
      '${jalaliDate.year}/${jalaliDate.month}/${jalaliDate.day}',
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildCategoryChips(List<dynamic> categories, BuildContext context) {
    return Wrap(
      spacing: 2.0,
      runSpacing: 2.0,
      children: categories.map<Widget>((category) {
        return Chip(
          label: Text(
            category.toString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          backgroundColor: Theme.of(context).chipTheme.backgroundColor,
        );
      }).toList(),
    );
  }

  Widget _buildTextCell(String value, BuildContext context, TextAlign textAlign) {
    return Text(
      value,
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: textAlign,
    );
  }
}


