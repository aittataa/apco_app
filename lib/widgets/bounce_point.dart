import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constant/app_constant.dart';
import '../constant/app_theme.dart';

class BouncePoint extends StatelessWidget {
  final double size;
  const BouncePoint({this.size = 64});

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: size,
      color: AppTheme.mainColor,
      duration: AppConstant.duration,
    );
  }
}
