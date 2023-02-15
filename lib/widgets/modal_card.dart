import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/widgets/arrow_circle.dart';

class ModalCard extends StatelessWidget {
  const ModalCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  final String imageAsset;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 84.0,
        child: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: const EdgeInsets.all(0.0),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 8.0,
              right: 8.0,
              bottom: 8.0,
            ),
            child: Row(
              children: [
                Image.asset(
                  imageAsset,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Color(0xFF5E5E5E),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Color(0xFF8A8A8A),
                        ),
                      )
                    ],
                  ),
                ),
                ArrowCircle(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
