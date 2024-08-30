import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:panel_cartel/features/admin/presentation/screens/admin_details_screen.dart';
import 'package:panel_cartel/features/admin/presentation/screens/admin_index_screen.dart';
import 'package:panel_cartel/features/auth/data/services/auth_service.dart';
import 'package:panel_cartel/features/auth/logic/cubit/auth_cubit.dart';
import 'package:panel_cartel/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'core/themes/theme_bloc.dart';
import 'core/themes/theme_state.dart';
import 'features/admin/data/services/admin_service.dart';
import 'features/admin/logic/cubit/admin_cubit.dart';
import 'features/admin/presentation/screens/admin_create_screen.dart';
import 'features/auth/presentation/screens/login_screen.dart';

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
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (_) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _router,
            title: 'Cartel Vision',
            theme: state.themeData,
          );
        },
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AdminIndexScreen.routeName,
        builder: (context, state) => const AdminIndexScreen(),
        routes: [
          GoRoute(
            path: AdminCreateScreen.routeName,
            builder: (context, state) => const AdminCreateScreen(),
          ),
          GoRoute(
            path: ':id',
            builder: (context, state) => const AdminDetailsScreen(),
          ),
        ],
      ),
    ],
  );
}
