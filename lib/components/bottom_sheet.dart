import 'package:flutter/material.dart';
import 'package:ollang_recipe/components/extensions.dart';
import 'package:ollang_recipe/components/my_media_query.dart';

import '../theme/text_style.dart';

mixin ModalBottomSheet {
  /// Bütün sayfalardaki bottom sheetler buradan çağırılır.
  static Future<T?> showBottomSheet<T>(Widget widget, BuildContext context,
      {required String title, Color? backgroundColor}) async {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.w),
          topRight: Radius.circular(20.w),
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  Divider(indent: MyMediaQuery.width * 0.4, endIndent: MyMediaQuery.width * 0.4, thickness: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(title, style: s20W600.copyWith(color: Theme.of(context).colorScheme.primary)),
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            widget,
          ],
        );
      },
    );
  }
}
