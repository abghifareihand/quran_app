import 'package:alquran_app/data/repositories/surah_repository.dart';
import 'package:alquran_app/presentation/home/bloc/surah/surah_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/styles/app_color.dart';
import '../../../core/styles/app_image.dart';

class DetailSurahPage extends StatelessWidget {
  final int number;
  const DetailSurahPage({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurahBloc(SurahRepository())..add(GetDetailSurah(number: number)),
      child: BlocBuilder<SurahBloc, SurahState>(
        builder: (context, state) {
          return Scaffold(
            appBar: _appBar(state, context),
            body: _body(state, context),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _appBar(SurahState state, BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(state is DetailSurahLoaded ? state.surah.namaLatin : ''),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppImage.iconSearch,
              colorFilter: ColorFilter.mode(
                AppColor.getIconColor(context),
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(SurahState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          // Header
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(
                  children: [
                    // Card purple
                    Container(
                      height: 257,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFDF98FA),
                            Color(0xFF9055FF),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    // Image quran
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Opacity(
                        opacity: 0.1,
                        child: SvgPicture.asset(
                          width: 324 - 55,
                          AppImage.quran,
                        ),
                      ),
                    ),

                    // Text
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 56,
                        vertical: 28,
                      ),
                      child: state is DetailSurahLoaded
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.surah.namaLatin,
                                    style: const TextStyle(
                                      fontSize: 26,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    state.surah.arti,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.white.withOpacity(0.35),
                                    thickness: 2,
                                    height: 32, // jarak atas divider 16 + 16 bawah
                                  ),

                                  // tempat turun dan ayat
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        state.surah.tempatTurun.toUpperCase(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
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
                                        '${state.surah.jumlahAyat} AYAT',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(
                                    height: 32.0,
                                  ),

                                  // bismillah
                                  SvgPicture.asset(
                                    AppImage.bismillah,
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],

        // List surah dan ayat
        body: state is DetailSurahLoaded
            ? ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 40),
                physics: const BouncingScrollPhysics(),
                itemCount: state.surah.ayat.length,
                separatorBuilder: (context, index) => const SizedBox(height: 24.0),
                itemBuilder: (context, index) {
                  final data = state.surah.ayat[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.getContainerAyat(context),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            //Number
                            Container(
                              width: 27,
                              height: 27,
                              decoration: BoxDecoration(
                                color: AppColor.getIconNumber(context),
                                borderRadius: BorderRadius.circular(27 / 2),
                              ),
                              child: Center(
                                child: Text(
                                  data.nomor.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.share_outlined,
                              color: AppColor.getIconNavActive(context),
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Icon(
                              Icons.play_circle_outlined,
                              color: AppColor.getIconNavActive(context),
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Icon(
                              Icons.bookmark_outline,
                              color: AppColor.getIconNavActive(context),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        data.ar,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Amiri',
                        ),
                        textAlign: TextAlign.end,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          data.idn,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Divider(height: 8),
                    ],
                  );
                },
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
