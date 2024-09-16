import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/surah/surah_bloc.dart';
import '../../widgets/list_surah_widget.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahBloc, SurahState>(
      bloc: context.read<SurahBloc>()..add(GetSurah()),
      builder: (context, state) {
        if (state is SurahLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is SurahLoaded) {
          final surah = state.surah;
          return ListSurahWidget(surah: surah);
        }

        if (state is SurahError) {
          return Center(
            child: Text(state.message),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
