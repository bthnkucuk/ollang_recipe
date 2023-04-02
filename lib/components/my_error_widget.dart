import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:ollang_recipe/core/assets.dart';

///[MyErrorWidget] is a class that use lottie animation and show error message.
class MyErrorWidget extends StatelessWidget {
  final String? error;
  const MyErrorWidget({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FractionallySizedBox(widthFactor: 0.1),
          FractionallySizedBox(
              widthFactor: 0.9, child: Lottie.asset(MyAssets.error)),
          Text(
            error ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
