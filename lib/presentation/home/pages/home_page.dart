import 'package:alquran_app/core/styles/app_color.dart';
import 'package:alquran_app/core/styles/app_image.dart';
import 'package:alquran_app/presentation/dashboard/widgets/language_switch.dart';
import 'package:alquran_app/presentation/home/pages/tabs/surah_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../dashboard/widgets/theme_switch.dart';
import '../widgets/card_surah.dart';
import '../widgets/greeting_name.dart';
import 'tabs/hijb_tab.dart';
import 'tabs/page_tab.dart';
import 'tabs/para_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    Color iconColor = AppColor.getIconColor(context);
    return AppBar(
      title: Row(
        children: [
          SvgPicture.asset(
            AppImage.iconMenu,
            colorFilter: ColorFilter.mode(
              iconColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(
            width: 24.0,
          ),
          const Text('Quran App'),
          const Spacer(),
          const ThemeSwitch(),
          const SizedBox(width: 8.0),
          const LanguageSwitch(),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            // Header
            const SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GreetingName(),
                  CardSurah(),
                ],
              ),
            ),

            // Tabbar
            SliverAppBar(
              backgroundColor: AppColor.getSliverAppbarColor(context),
              pinned: true,
              elevation: 0,
              shape: Border(
                bottom: BorderSide(
                  width: 3,
                  color: const Color(0xff8789A3).withOpacity(0.1),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: _tab(context),
              ),
            ),
          ],
          body: const TabBarView(
            children: [
              SurahTab(),
              ParaTab(),
              PageTab(),
              HijbTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tab(context) {
    return TabBar(
      indicatorColor: AppColor.getTabColorIndicator(context),
      labelColor: AppColor.getTabColorActive(context),
      unselectedLabelColor: AppColor.getTabColorDisable(context),
      tabs: [
        _tabItem(label: 'Surah', context: context),
        _tabItem(label: 'Para', context: context),
        _tabItem(label: 'Page', context: context),
        _tabItem(label: 'Hijb', context: context),
      ],
    );
  }

  Widget _tabItem({required String label, required BuildContext context}) {
    return Tab(
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
