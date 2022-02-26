import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class LoadingDesign extends StatelessWidget {
  final String? title;
  const LoadingDesign({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildLoadingDesign();
  }

  Widget _buildLoadingDesign() {
    return  BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          color: Colors.black.withOpacity(0.25),
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              Empty(height: 20),
              Text(title??'')
            ],
          )),
        ),
      );
  }
}
