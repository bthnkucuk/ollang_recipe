import 'package:flutter/material.dart';

import 'package:ollang_recipe/core/extensions.dart';

///Some api texts cant be encode properly,
/// [Utf8EncodedText] is a [Text] widget that encodes the [text] to UTF-8.
class Utf8EncodedText extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  const Utf8EncodedText(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return const Text('');
    } else {
      return Text(
        text!.utf8CodecEncoded,
        style: style,
        overflow: overflow,
        maxLines: maxLines,
      );
    }
  }
}
