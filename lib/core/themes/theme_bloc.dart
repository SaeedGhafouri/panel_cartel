import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:panel_cartel/core/themes/theme_event.dart';
import 'package:panel_cartel/core/themes/theme_state.dart';

import 'theme_data.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: lightTheme)) {
    on<ToggleThemeEvent>((event, emit) {
      final isLightTheme = state.themeData.brightness == Brightness.light;
      final newTheme = isLightTheme ? darkTheme : lightTheme;
      emit(ThemeState(themeData: newTheme));
    });
  }
}