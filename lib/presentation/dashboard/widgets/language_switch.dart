import 'package:alquran_app/core/styles/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/locale_cubit.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        bool isIndo = locale.languageCode == 'id';

        return GestureDetector(
          onTap: () {
            context.read<LocaleCubit>().toggleLocale();
          },
          child: Container(
            width: 48,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: isIndo ? Alignment.centerRight : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      isIndo ? 'ID' : 'EN',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: isIndo ? 0 : 24,
                  right: isIndo ? 24 : 0,
                  child: Container(
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      fit: BoxFit.cover,
                      isIndo ? AppImage.iconId : AppImage.iconEn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
