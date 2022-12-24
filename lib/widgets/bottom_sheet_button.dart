import 'package:flutter/material.dart';

class BottomSheetButton extends StatefulWidget {
  const BottomSheetButton({super.key});

  @override
  State<BottomSheetButton> createState() => _BottomSheetButtonState();
}

class _BottomSheetButtonState extends State<BottomSheetButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        child: Text('open sheet'),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: ((context) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Form start"),
                    OutlinedButton(
                      child: const Text('Close'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                )),
          );
        });
  }
}
