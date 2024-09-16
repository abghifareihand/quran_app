import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('id'));

  void toggleLocale() {
    if (state.languageCode == 'id') {
      emit(const Locale('en'));
    } else {
      emit(const Locale('id'));
    }
  }
}
