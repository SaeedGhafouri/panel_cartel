import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:panel_cartel/core/widgets/image_diplay_widget.dart';
import 'package:panel_cartel/core/widgets/progress_widget.dart';
import '../../features/Category/data/services/category_service.dart';
import '../../features/Category/logic/cubit/category_cubit.dart';
import '../../features/Category/logic/cubit/category_state.dart';


class CategoryDialog extends StatelessWidget {
  final Function(int, String) onSelected;

  CategoryDialog({required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(CategoryService(Dio()))..fetchCategories(),
      child: Dialog(
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: smallRadius),
        child: FractionallySizedBox(
          widthFactor: 0.3,
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return Container(
                  height: 200,
                  child: Center(child: ProgressWidget()),
                );
              } else if (state is CategoryLoaded) {
                return Container(
                  padding: container,
                  height: 400,
                  child: ListView.builder(
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      final Category = state.categories[index];
                      return InkWell(
                        onTap: () {
                          onSelected(Category.id, Category.name);
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
                                    Text(Category.name),
                                    SizedBox(height: 5),
                                    Text(
                                      Category.description ?? '',
                                      style: Theme.of(context).textTheme.headlineMedium,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              ImageDisplayWidget(
                                imageUrl: Category.image ?? '',
                                size: 40,
                                isShow: false,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is CategoryError) {
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