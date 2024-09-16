import 'package:alquran_app/presentation/home/pages/detail_surah_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/styles/app_image.dart';
import '../../../data/models/surah_model.dart';

class ListSurahWidget extends StatelessWidget {
  final List<SurahModel> surah;
  const ListSurahWidget({
    super.key,
    required this.surah,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: surah.length,
      separatorBuilder: (context, index) => Divider(
        color: const Color(0xffBBC4CE).withOpacity(0.35),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, index) {
        final data = surah[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailSurahPage(number: data.nomor),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Number of surah
                Stack(
                  children: [
                    SvgPicture.asset(
                      AppImage.noSurah,
                    ),
                    SizedBox(
                      height: 36.0,
                      width: 36.0,
                      child: Center(
                        child: Text(
                          data.nomor.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.namaLatin,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data.tempatTurun == 'mekah' ? AppLocalizations.of(context)!.mecca.toUpperCase() : AppLocalizations.of(context)!.medina.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.white.withOpacity(0.35),
                          ),
                        ),
                        Text(
                          '${data.jumlahAyat} AYAT',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  data.nama,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
