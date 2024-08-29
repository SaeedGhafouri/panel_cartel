import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/themes/theme_bloc.dart';
import 'core/themes/theme_state.dart';
import 'features/admin/data/data_sources/admin_service.dart';
import 'features/admin/logic/cubit/admin_cubit.dart';
import 'routes.dart';

void main() {
  //Admin Cubit
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AdminCubit>(create: (context) => AdminCubit(AdminService(Dio())),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (_) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter App',
            theme: state.themeData,
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      ),
    );
  }
}
