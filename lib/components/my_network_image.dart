import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ollang_recipe/components/my_error_widget.dart';

///[MyNetworkImage] is a class that use cached_network_image package and show image.
///If image is not found, it shows [MyErrorWidget].
///If user open recipe in favorite page, it shows image from local storage.
class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({super.key, required this.url, this.width, this.height});

  final String? url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url!,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
          height: 30,
          margin: const EdgeInsets.all(10),
          child: const FittedBox(child: CircularProgressIndicator.adaptive())),
      errorWidget: (context, url, error) => const MyErrorWidget(),
    );
  }
}
