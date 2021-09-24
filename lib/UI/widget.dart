import 'package:flutter/material.dart';

class RowwClass extends StatelessWidget {
  const RowwClass(
      {Key? key,
      required this.label,
      required this.opacity,
      required this.icon})
      : super(key: key);

  final String label;
  final double opacity;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(
            width: 12,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
