import 'package:flutter/material.dart';

import '../../../../../shared/utils/images.dart';

class WelcomeWidget extends StatelessWidget {
  final String welcomeText;
  final Color textColor;
  const WelcomeWidget({
    super.key,
    required this.welcomeText,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (!(Theme.of(context).brightness == Brightness.dark))
                Image.asset(
                  ImagesAsset.pharmacyLogo,
                  scale: 10,
                ),
              Text(
                "Intelligent Pharmacy",
                style: textTheme.titleLarge!.copyWith(color: Colors.white),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 4),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  welcomeText,
                  style: textTheme.titleLarge!.copyWith(color: textColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
