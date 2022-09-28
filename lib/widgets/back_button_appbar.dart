import 'package:flutter/material.dart';

class BackButtonedAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget defaultIcon = const Icon(
    Icons.arrow_back_ios_new,
    color: Colors.black,
  );
  const BackButtonedAppBar(
      {super.key, this.elevation = 0, this.icon, this.onTap});

  final double elevation;
  final Widget? icon;
  final void Function()? onTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 80,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: IconButton(
              icon: icon ?? defaultIcon,
              onPressed: () => onTap ?? Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
      elevation: elevation,
    );
  }
}
