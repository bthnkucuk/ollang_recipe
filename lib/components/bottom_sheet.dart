import 'package:flutter/material.dart';
import 'package:ollang_recipe/core/extensions.dart';
import 'package:ollang_recipe/core/my_media_query.dart';

import '../core/theme/text_style.dart';

///[ModalBottomSheet] is a class that contains all the bottom sheets in the app.
mixin ModalBottomSheet {
  static Future<T?> showBottomSheet<T>(Widget widget, BuildContext context,
      {required String title, Color? backgroundColor}) async {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor:
          backgroundColor ?? Theme.of(context).colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.w),
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: MyMediaQuery.height * 0.7,
          child: Column(
            children: [
              Material(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.w),
                ),
                elevation: 10,
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Divider(
                        indent: MyMediaQuery.width * 0.4,
                        endIndent: MyMediaQuery.width * 0.4,
                        thickness: 4),
                    Text(title, style: s24W600(context)),
                    SizedBox(height: 5.h),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [widget],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
