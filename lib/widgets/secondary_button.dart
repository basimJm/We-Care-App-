import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/themes/app_theme.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color backgroundColor;

  const SecondaryButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: kButtonColor,
          width: 1.5,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              title,
              style: const TextStyle(
                color: kButtonColor,
                fontSize: 17.0,
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12.0),
                splashColor: Colors.grey.withOpacity(0.5),
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
