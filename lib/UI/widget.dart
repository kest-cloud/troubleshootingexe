import 'package:flutter/material.dart';

class RowwClass extends StatelessWidget {
  const RowwClass({Key? key, required this.label, required this.opacity})
      : super(key: key);

  final String label;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
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
