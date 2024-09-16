import 'package:flutter/material.dart';

class GreetingName extends StatelessWidget {
  const GreetingName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Assalamualaikum',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Text(
          'Abghi Fareihan',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 24.0,
        ),
      ],
    );
  }
}
