import 'package:alquran_app/core/styles/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dashboard/widgets/bottom_navbar.dart';
import 'dashboard/widgets/language_switch.dart';
import 'dashboard/widgets/theme_switch.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LanguageSwitch(),
                SizedBox(width: 20.0),
                ThemeSwitch(),
              ],
            ),
            SizedBox(
              width: 300,
              child: Column(
                children: [
                  Text(
                    'Quran App',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    AppLocalizations.of(context)!.splashSubtitle,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    height: 450,
                    AppImage.imgSplash,
                  ),
                  Positioned(
                    bottom: -20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BottomNavBarPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: 185,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xffF9B091),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.splashButtonText,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
