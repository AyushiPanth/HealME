import 'package:flutter/material.dart';
import 'package:healme/constants.dart';

class CustomButtonWidget extends StatelessWidget {
  final double size;
  final double borderWidth;
  final Widget child;
  final String image;
  final bool isActive;
  final VoidCallback onTap;

  CustomButtonWidget({
    this.child,
    @required this.size,
    this.image,
    this.borderWidth = 2,
    this.isActive = false,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(200),
      ),
      border: Border.all(
        width: borderWidth,
        color: isActive ? AppColors.darkBlue : AppColors.mainColor,
      ),
    );

    if (image != null) {
      boxDecoration = boxDecoration.copyWith(
        image:
            DecorationImage(image: ExactAssetImage(image), fit: BoxFit.cover),
      );
    }

    if (isActive) {
      boxDecoration = boxDecoration.copyWith(
        gradient: RadialGradient(
          colors: [
            AppColors.lightBlue,
            AppColors.darkBlue,
          ],
        ),
      );
    } else {
      boxDecoration = boxDecoration.copyWith(
        gradient: RadialGradient(
          colors: [
            AppColors.mainColor,
            AppColors.mainColor,
            AppColors.mainColor,
            Colors.white,
          ],
        ),
      );
    }
    return Container(
      width: size,
      height: size,
      decoration: boxDecoration,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(200),
          ),
        ),
        child: child ?? Container(),
      ),
    );
  }
}
