import 'package:ds/ds.dart';
import 'package:flutter/material.dart';

class HomeLoadingStateWidget extends StatelessWidget {
  const HomeLoadingStateWidget({super.key});

  final DSColors colors = const DSColors();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(
          color: colors.blueLight,
        ),
      ),
    );
  }
}
