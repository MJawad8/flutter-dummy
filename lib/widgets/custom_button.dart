import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/screen_size.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      this.onTap,
      this.btnColor,
      this.radius,
      this.textColor,
      this.hasEndIcon = true,
      this.horizontalPadding,
      this.verticalPadding})
      : super(key: key);
  final String text;
  final VoidCallback? onTap;
  final Color? btnColor;
  final Color? textColor;
  final double? radius;
  final bool hasEndIcon;
  final double? horizontalPadding;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius ?? 30),
      color: btnColor ?? AppColors.greenColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius ?? 30),
        splashColor: AppColors.whiteColor.withOpacity(0.5),
        onTap: onTap,
        child: Container(
          // constraints: BoxConstraints(minWidth: ScreenSize.screenWidthPer(context, 60)),
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal:
                  ScreenSize.screenHeightPer(context, horizontalPadding ?? 2),
              vertical:
                  ScreenSize.screenHeightPer(context, verticalPadding ?? 2)),
          child: Center(
            child: CustomText(
                textAlign: TextAlign.center,
                text: text,
                color: textColor ?? AppColors.whiteColor,
                fontWeight: FontWeight.w600,
                fontSize: ScreenSize.screenHeightPer(context, 1.8)),
          ),
        ),
      ),
    );
  }
}

/*
Material(
      borderRadius: BorderRadius.circular(radius ?? 15),
      color: btnColor ?? AppColors.primaryGreenColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius??15),
        splashColor: AppColors.whiteColor.withOpacity(0.5),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: ScreenSize.screenHeightPer(context, 2)),
          child: Center(
              child: CustomText(
            text: text,
            color:textColor?? AppColors.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: ScreenSize.screenHeightPer(context, 2),
          )),
        ),
      ),
    );
 */
