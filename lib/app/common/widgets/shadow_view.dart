import 'package:flutter/material.dart';

class ShadowView extends StatelessWidget {
  final Widget child;

  ShadowView({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 8,
            offset: const Offset(1, 3),
          ),
        ],
      ),
    );
  }
}
