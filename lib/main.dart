import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:panel_cartel/features/admin/presentation/screens/admin_details_screen.dart';
import 'package:panel_cartel/features/admin/presentation/screens/admin_index_screen.dart';
import 'package:panel_cartel/features/auth/data/services/auth_service.dart';
import 'package:panel_cartel/features/auth/logic/cubit/auth_cubit.dart';
import 'package:panel_cartel/features/product/data/services/product_service.dart';
import 'package:panel_cartel/features/product/logic/cubit/index/product_index_cubit.dart';
import 'core/themes/theme_bloc.dart';
import 'core/themes/theme_state.dart';
import 'core/utils/app_router.dart';
import 'features/Category/data/services/category_service.dart';
import 'features/Category/logic/cubit/Category_cubit.dart';
import 'features/admin/data/services/admin_service.dart';
import 'features/admin/logic/cubit/admin_cubit.dart';
import 'features/brand/data/services/brand_service.dart';
import 'features/brand/logic/cubit/brand_cubit.dart';
import 'features/product/data/services/barcode_service.dart';
import 'features/product/logic/cubit/barcode_cubit.dart';
import 'features/product/logic/cubit/create/product_create_cubit.dart';
import 'features/product/logic/cubit/destroy/product_destroy_cubit.dart';
import 'features/product/logic/cubit/show/product_show_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AdminCubit>(
          create: (context) => AdminCubit(AdminService(Dio())),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(AuthService(Dio())),
        ),
        BlocProvider<BrandCubit>(
          create: (context) => BrandCubit(BrandService(Dio())),
        ),
        BlocProvider<CategoryCubit>(
          create: (context) => CategoryCubit(CategoryService(Dio())),
        ),
        BlocProvider<BarcodeCubit>(
          create: (context) => BarcodeCubit(BarcodeService(Dio())),
        ),
        /// Product
        BlocProvider<ProductIndexCubit>(
          create: (context) => ProductIndexCubit(ProductService(Dio())),
        ),
        BlocProvider<ProductCreateCubit>(
          create: (context) => ProductCreateCubit(ProductService(Dio())),
        ),
        BlocProvider<ProductDestroyCubit>(
          create: (context) => ProductDestroyCubit(ProductService(Dio())),
        ),
        BlocProvider<ProductShowCubit>(
          create: (context) => ProductShowCubit(ProductService(Dio())),
        )
      ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (_) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _appRouter.router,
            title: 'Cartel Vision',
            theme: state.themeData,
          );
        },
      ),
    );
  }
}

