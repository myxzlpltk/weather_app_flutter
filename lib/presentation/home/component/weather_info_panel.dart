import "package:flutter/material.dart";

class WeatherInfoPanel extends StatelessWidget {
  final String title;
  final String metric;

  const WeatherInfoPanel({
    super.key,
    required this.title,
    required this.metric,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          metric,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
