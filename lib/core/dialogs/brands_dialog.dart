import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:panel_cartel/core/widgets/image_diplay_widget.dart';
import 'package:panel_cartel/core/widgets/progress_widget.dart';
import '../../features/brand/data/services/brand_service.dart';
import '../../features/brand/logic/cubit/index/brand_index_cubit.dart';
import '../../features/brand/logic/cubit/index/brand_index_state.dart';

class BrandsDialog extends StatelessWidget {
  final Function(int, String) onBrandSelected;

  BrandsDialog({required this.onBrandSelected});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrandIndexCubit(BrandService(Dio()))..index(),
      child: Dialog(
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: smallRadius),
        child: FractionallySizedBox(
          widthFactor: 0.3,
          child: BlocBuilder<BrandIndexCubit, BrandIndexState>(
            builder: (context, state) {
              if (state is BrandIndexLoading) {
                return Container(
                  height: 200,
                  child: Center(child: ProgressWidget()),
                );
              } else if (state is BrandIndexLoaded) {
                return Container(
                  padding: container,
                  height: 400,
                  child: ListView.builder(
                    itemCount: state.brands.length,
                    itemBuilder: (context, index) {
                      final brand = state.brands[index];
                      return InkWell(
                        onTap: () {
                          onBrandSelected(brand.id, brand.name);
                          Navigator.of(context).pop();
                        },
                        borderRadius: smallRadius,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                IconsaxPlusLinear.arrow_left_1,
                                size: 15,
                                color: Theme.of(context).iconTheme.color!.withOpacity(0.3),
                              ),
                              Expanded(
                                flex: 8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(brand.name),
                                    SizedBox(height: 5),
                                    Text(
                                      brand.description ?? '',
                                      style: Theme.of(context).textTheme.headlineMedium,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              ImageDisplayWidget(
                                imageUrl: brand.image ?? '',
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is BrandIndexError) {
                return Container(
                  height: 200,
                  child: Center(child: Text('Error: ${state.message}')),
                );
              } else {
                return Container(
                  height: 200,
                  child: Center(child: Text('No data available')),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}