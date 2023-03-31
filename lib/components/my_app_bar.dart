import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.trailingOnPressed,
    this.leadingOnPressed,
    this.leadingIcon,
    this.trailingIcon,
    required this.centerTitle,
  });

  final VoidCallback? trailingOnPressed;
  final VoidCallback? leadingOnPressed;
  final String centerTitle;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      centerTitle: true,
      title: Text(centerTitle),
      leading: IconButton(
        onPressed: leadingOnPressed,
        icon: Icon(
          leadingIcon,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            trailingIcon,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: trailingOnPressed,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
