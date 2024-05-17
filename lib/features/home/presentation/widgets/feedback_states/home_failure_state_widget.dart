import 'package:ds/ds.dart';
import 'package:flutter/material.dart';

class HomeFailureStateWidget extends StatelessWidget {
  HomeFailureStateWidget({super.key});

  final DSColors colors = const DSColors();
  final DSFonts fonts = DSFonts();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: colors.red,
            size: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "We’re not able to load. Please, try again later.",
                  textAlign: TextAlign.center,
                  style: fonts.bodyMedium.copyWith(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
