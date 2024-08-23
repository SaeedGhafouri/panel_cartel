import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/themes/theme_bloc.dart';
import 'core/themes/theme_state.dart';
import 'core/themes/theme_data.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      // Providing ThemeBloc to the whole widget tree
      create: (_) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter App',
            theme: state.themeData,
            darkTheme: ThemeData.dark(),
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      ),
    );
  }
}
