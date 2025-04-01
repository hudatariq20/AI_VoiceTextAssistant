import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BounceIn(child: const Text('AIA Orbis')),
      leading: const Icon(Icons.menu),
      centerTitle: true,
      elevation: 4,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Theme.of(context)
          .colorScheme
          .secondaryContainer,
      shadowColor: Theme.of(context).colorScheme.shadow, // M3 shadow color
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}