import 'package:flutter/material.dart';

class UserControlsButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function onClick;

  const UserControlsButton({Key? key, required this.title, required this.color, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: color.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: InkWell(
            onTap: () => onClick(),
            child: Text(
              title,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

}
