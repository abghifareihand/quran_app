part of 'surah_bloc.dart';

abstract class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

class SurahInitial extends SurahState {}

class SurahLoading extends SurahState {}

class SurahLoaded extends SurahState {
  final List<SurahModel> surah;

  const SurahLoaded({required this.surah});
  @override
  List<Object> get props => [surah];
}

class DetailSurahLoaded extends SurahState {
  final DetailSurahModel surah;

  const DetailSurahLoaded({required this.surah});
  @override
  List<Object> get props => [surah];
}

class SurahError extends SurahState {
  final String message;

  const SurahError({required this.message});
}
