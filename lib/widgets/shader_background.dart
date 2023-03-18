import 'package:flutter/material.dart';

import '../app_theme/theme.dart';

class ShaderBackground extends StatelessWidget {
  const ShaderBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(colors: [
          Colors.white,
          Colors.white.withOpacity(0.5),
          Colors.white.withOpacity(0.0)
        ], stops: const [
          0.0,
          0.4,
          0.8
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
            .createShader(bounds);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
    );
  }
}
