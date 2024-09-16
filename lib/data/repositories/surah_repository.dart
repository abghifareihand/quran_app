import 'dart:convert';
import 'dart:developer';

import 'package:alquran_app/data/models/detail_surah_model.dart';
import 'package:alquran_app/data/models/surah_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class SurahRepository {
  Future<Either<String, List<SurahModel>>> getSurah() async {
    final response = await http.get(
      Uri.parse('https://equran.id/api/surat'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<SurahModel> surah = jsonData.map((item) => SurahModel.fromJson(item)).toList();
      return Right(surah);
    } else {
      return const Left('Error get surah');
    }
  }

  Future<Either<String, DetailSurahModel>> detailSurah(int number) async {
    final response = await http.get(
      Uri.parse('https://equran.id/api/surat/$number'),
    );
    log('Response Get Detail Surah : ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final DetailSurahModel detailSurah = DetailSurahModel.fromJson(jsonData);
      return Right(detailSurah);
    } else {
      return const Left('Error get detail surah');
    }
  }
}
