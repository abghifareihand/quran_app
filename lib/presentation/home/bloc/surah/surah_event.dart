part of 'surah_bloc.dart';

abstract class SurahEvent extends Equatable {
  const SurahEvent();

  @override
  List<Object> get props => [];
}

class GetSurah extends SurahEvent {}

class GetDetailSurah extends SurahEvent {
  final int number;

  const GetDetailSurah({required this.number});
}
