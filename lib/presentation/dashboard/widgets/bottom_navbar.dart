import 'package:alquran_app/core/styles/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/styles/app_color.dart';
import '../cubit/page_cubit.dart';
import '../../home/pages/home_page.dart';

class BottomNavBarPage extends StatelessWidget {
  const BottomNavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, page) {
        final navbarColor = AppColor.getNavbarColor(context);
        final navActiveColor = AppColor.getIconNavActive(context);
        final navDisableColor = AppColor.getIconNavDisable(context);
        return Scaffold(
          body: IndexedStack(
            index: page,
            children: const [
              HomePage(),
              Center(
                child: Text('Idea'),
              ),
              Center(
                child: Text('Sholat'),
              ),
              Center(
                child: Text('Doa'),
              ),
              Center(
                child: Text('Booked'),
              ),
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: 65,
            child: BottomAppBar(
              elevation: 8.0,
              color: navbarColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      AppImage.iconQuran,
                      colorFilter: ColorFilter.mode(
                        page == 0 ? navActiveColor : navDisableColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    onPressed: () => context.read<PageCubit>().selectPage(0),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      AppImage.iconIdea,
                      colorFilter: ColorFilter.mode(
                        page == 1 ? navActiveColor : navDisableColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    onPressed: () => context.read<PageCubit>().selectPage(1),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      AppImage.iconSholat,
                      colorFilter: ColorFilter.mode(
                        page == 2 ? navActiveColor : navDisableColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    onPressed: () => context.read<PageCubit>().selectPage(2),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      AppImage.iconDoa,
                      colorFilter: ColorFilter.mode(
                        page == 3 ? navActiveColor : navDisableColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    onPressed: () => context.read<PageCubit>().selectPage(3),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      AppImage.iconBook,
                      colorFilter: ColorFilter.mode(
                        page == 4 ? navActiveColor : navDisableColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    onPressed: () => context.read<PageCubit>().selectPage(4),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
