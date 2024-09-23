import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panel_cartel/core/widgets/button_widget.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:panel_cartel/core/widgets/text_field_widget.dart';

import '../themes/themes.dart';
import '../widgets/spinner_widget.dart';

class PriceAndQuantityDialog extends StatelessWidget {
  const PriceAndQuantityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: smallRadius),
      child: FractionallySizedBox(
        widthFactor: 0.3,
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: FormWidget(
                body: Column(
              children: [
                const TableHeaderWidget(
                  title: 'قیمت',
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldWidget(
                        label: 'قیمت واحد',
                      ),
                    ),
                    const SizedBox(
                      width: spacingThin,
                    ),
                    Expanded(
                      child: TextFieldWidget(
                        label: 'قیمت فروش',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: spacingSmall,
                ),
                const TableHeaderWidget(
                  title: 'تخفیف',
                ),
                Row(
                  children: [
                    Expanded(
                      child: SpinnerWidget(
                        label: 'نوع تخفیف',
                        items: const ['مبلغ', 'درصد'],
                        onChanged: (value) {
                          ;
                        },
                      ),
                    ),
                    const SizedBox(width: spacingThin),
                    Expanded(
                      child: TextFieldWidget(
                        label: 'مقدار تخفیف',
                        inputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: spacingSmall,
                ),
                const TableHeaderWidget(
                  title: 'موجودی',
                ),
                Row(
                  children: [
                    //Type
                    Expanded(
                      child: SpinnerWidget(
                        label: 'نوع بسته',
                        items: const [
                          'عدد',
                          'بسته',
                          'کارتن',
                          'شیرینگ',
                          'کیسه',
                          'پالت',
                          'کلاف',
                          'قوطی',
                          'جعبه'
                        ],
                      ),
                    ),
                    const SizedBox(width: spacingThin),
                    //Qantity
                    Expanded(
                      child: TextFieldWidget(
                        label: 'موجودی',
                        inputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: spacingSmall),
                ButtonWidget(
                  text: 'ویرایش',
                  onPressed: () {},
                ),
                /*const SizedBox(height: spacingThin),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('بستن', style: TextStyle(color: Theme.of(context).textTheme.headlineSmall?.color),)
                )*/
              ],
            ))),
      ),
    );
  }
}
