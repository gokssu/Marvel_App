import 'package:flutter/material.dart';
import 'package:marvel_app/view/theme/colors.dart';
import 'package:marvel_app/view/theme/context_extension.dart';
class BackGround extends StatelessWidget {
  final Widget body;
  BackGround(this.body);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: context.dynamicMultiWidth(0.09)),
      width: context.dynamicMultiWidth(1),
      height: context.dynamicHeight(1),
      decoration: BoxDecoration(
      color: ColorConstants.instance.backgroudColor
      ),
      child: body,
    );
  }
}
