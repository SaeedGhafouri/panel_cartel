import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:panel_cartel/core/themes/theme_event.dart';
import 'package:panel_cartel/core/themes/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: ThemeData.light())) {
    // Registering the event handler for ToggleThemeEvent
    on<ToggleThemeEvent>((event, emit) {
      // Toggle between light and dark themes
      final isLightTheme = state.themeData.brightness == Brightness.light;
      final newTheme = isLightTheme ? ThemeData.dark() : ThemeData.light();
      emit(ThemeState(themeData: newTheme));
    });
  }
}