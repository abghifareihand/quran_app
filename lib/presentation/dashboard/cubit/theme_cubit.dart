import 'package:alquran_app/core/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme.lightTheme);

  void toggleTheme() {
    if (state.brightness == Brightness.dark) {
      emit(AppTheme.lightTheme);
    } else {
      emit(AppTheme.darkTheme);
    }
  }
}
