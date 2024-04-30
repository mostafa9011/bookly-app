import 'package:bookly/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(BuildContext context, String? url) async {
  if (url != null) {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // ignore: use_build_context_synchronously
      customSnakBar(context, url);
    }
  }
}

void customSnakBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      closeIconColor: Constants.primaryColor,
      showCloseIcon: true,
      content: Text(
        "can't launch url $text",
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Constants.primaryColor,
        ),
      ),
    ),
  );
}
