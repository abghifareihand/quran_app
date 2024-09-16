import 'package:alquran_app/data/models/detail_surah_model.dart';
import 'package:alquran_app/data/models/surah_model.dart';
import 'package:alquran_app/data/repositories/surah_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'surah_event.dart';
part 'surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  final SurahRepository surahRepository;
  SurahBloc(this.surahRepository) : super(SurahInitial()) {
    on<GetSurah>((event, emit) async {
      emit(SurahLoading());
      final result = await surahRepository.getSurah();
      result.fold(
        (error) => emit(SurahError(message: error)),
        (data) => emit(SurahLoaded(surah: data)),
      );
    });

    on<GetDetailSurah>((event, emit) async {
      emit(SurahLoading());
      final result = await surahRepository.detailSurah(event.number);
      result.fold(
        (error) => emit(SurahError(message: error)),
        (data) => emit(DetailSurahLoaded(surah: data)),
      );
    });
  }
}
