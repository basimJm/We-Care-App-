import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/themes/app_theme.dart';

class RetryFetch extends StatelessWidget {
  const RetryFetch({
    super.key,
    this.errorMessage,
    this.onPressed,
    this.textColor,
  });

  final String? errorMessage;
  final Function? onPressed;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$errorMessage',
            style: TextStyle(
              fontSize: 20.0,
              color: textColor,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: kPrimaryColor,
            ),
            onPressed: onPressed as void Function()?,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
