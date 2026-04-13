import 'package:flutter/material.dart';

class ResponsivePairLayout extends StatelessWidget {
  const ResponsivePairLayout({
    super.key,
    required this.first,
    required this.second,
    this.breakpoint = 720,
    this.spacing = 16,
  });

  final Widget first;
  final Widget second;
  final double breakpoint;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < breakpoint) {
          return Column(
            children: [
              first,
              SizedBox(height: spacing),
              second,
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: first),
            SizedBox(width: spacing),
            Expanded(child: second),
          ],
        );
      },
    );
  }
}
