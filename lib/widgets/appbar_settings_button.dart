import 'package:flutter/material.dart';

class AppBarSettingsButton extends StatelessWidget {
  const AppBarSettingsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {
          print("settings pressed");
        });
  }
}
