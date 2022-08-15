
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../componant/CustomTextFieldWidget.dart';


class TextFieldMobileWidget extends StatelessWidget {
  TextFieldMobileWidget({required this.textEditingController, this.value});

  String? value;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FromTextShared(
        labelText: 'mobile_number'.tr,
        maxLength: 11,
        onChanged: (value) {
          value = value;
        },
        onSaved: (String? value){
          value = value!;
        },
        isPassword: false,
        onTapValidator: (value) {
          if (value!.isEmpty) {
            return 'must_not_empty'.tr;
          } else if (!(value.length > 10)) {
            return 'not_valid'.tr;
          }
          return null;
        },
        namePath: Assets.iconsMobilePhoneIcon,
        width: 25,
        height: 25,
        keyboardType: TextInputType.number,
        Controller: textEditingController,
        hintText: 'mobile_number'.tr);
  }
}


class TextFieldPasswordWidget extends StatefulWidget {
  TextFieldPasswordWidget({required this.textEditingController,required this.isPassword});
  bool isPassword = false;
  TextEditingController textEditingController = TextEditingController();

  @override
  State<TextFieldPasswordWidget> createState() => _TextFieldPasswordWidgetState();
}

class _TextFieldPasswordWidgetState extends State<TextFieldPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return FromTextShared(
      //  textAlign: TextAlign.center,
      labelText: 'password'.tr,
      isPassword: widget.isPassword,
      onTapsuffixIcon: () {
        setState(() {
          widget.isPassword = !widget.isPassword;
        });
      },
      onTapValidator: (value) {
        if (value!.isEmpty) {
          return 'must_not_empty'.tr;
        } else if (value.length <= 5) {
          return 'short_password'.tr;
        }
        return null;
      },
      namePath: Assets.iconsPasswordIcon,
      suffixIcon: widget.isPassword
          ? Icons.visibility_sharp
          : Icons.visibility_off,
      keyboardType: TextInputType.text,
      maxLines: 1,
      Controller: widget.textEditingController,
      hintText: 'password'.tr,
    );
  }
}


