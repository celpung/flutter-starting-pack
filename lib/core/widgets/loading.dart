import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../themes/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Center(
        child: LoadingAnimationWidget.flickr(
          leftDotColor: AppColors.primary,
          rightDotColor: const Color.fromARGB(255, 253, 253, 253),
          size: 100,
        ),
      ),
    );
  }
}
