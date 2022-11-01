import 'package:flutter/material.dart';

class IosScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => const ClampingScrollPhysics();

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection)=>child;
}
