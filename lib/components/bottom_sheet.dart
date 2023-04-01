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
          topLeft: Radius.circular(30.w),
          topRight: Radius.circular(30.w),
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: MyMediaQuery.height * 0.7,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Divider(indent: MyMediaQuery.width * 0.4, endIndent: MyMediaQuery.width * 0.4, thickness: 4),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(title, style: s24W600(context)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              widget,
            ],
          ),
        );
      },
    );
  }
}
