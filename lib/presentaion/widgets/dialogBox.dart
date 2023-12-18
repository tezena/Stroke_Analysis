import 'package:flutter/material.dart';

class DialogBox {
  Future<void> dialogBuilder1(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registertion complete.'),
          content: const Text(
            "You have registered successfully; you can log in now.",
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/login");
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> dialogBuilder2(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registertion complete.'),
          content: const Text(
            "Incorrect input or connection Problem. Please try again.",
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
