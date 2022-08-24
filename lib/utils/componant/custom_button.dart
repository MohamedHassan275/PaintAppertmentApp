import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../constant/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onTap,
    required this.title,
    required this.color,
    this.radius,
    this.size,
  });
  final String title;
  final Function onTap;
  final Color color;
  final Size? size;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 20),
        ),
        fixedSize: MaterialStateProperty.all<Size>(size ?? Size(40.w, 6.h)),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shadowColor: MaterialStateProperty.all<Color>(lighGreyColor),
        elevation: MaterialStateProperty.all<double>(10),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 20.0))),
      ),
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
      ),
    );
  }
}
