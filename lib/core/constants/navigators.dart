import 'package:flutter/widgets.dart';

void pop({required BuildContext context}) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Navigator.of(context).pop();
  });
}

void pushNamed({required BuildContext context, required String routeName}) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Navigator.of(context).pushNamed(routeName);
  });
}

void popAndPushNamed(
    {required BuildContext context, required String routeName}) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Navigator.of(context).popAndPushNamed(routeName);
  });
}

void pushReplacementNamed({
  required BuildContext context,
  required String routeName,
}) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Navigator.of(context).popAndPushNamed(routeName);
  });
}
