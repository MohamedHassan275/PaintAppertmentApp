
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../componant/CustomTextFieldWidget.dart';


class CustomTextFieldWidget extends StatelessWidget {
  CustomTextFieldWidget({required this.title, required this.textEditingController,required this.keyboardType,this.maxLength});

  late String title;
  int? maxLength;
  TextEditingController textEditingController = TextEditingController();
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return FromTextShared2(
        labelText: title.tr,
        maxLength: maxLength,
        onChanged: (value) {
          value = value;
        },
        onSaved: (String? value){
          value = value!;
        },
        onTapValidator: (value) {
          if (value!.isEmpty) {
            return 'must_not_empty'.tr;
          } else if (!(value.length > 10)) {
            return 'not_valid'.tr;
          }
          return null;
        },
        keyboardType: keyboardType,
        Controller: textEditingController,
        hintText: title.tr);
  }
}

class TextFieldMobileWidget extends StatelessWidget {
  TextFieldMobileWidget({required this.textEditingController});

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FromTextShared(
        labelText: 'mobile_number'.tr,
        maxLength: 12,
        isPassword: false,
        onChanged: (value) {
          value = value;
        },
        onSaved: (String? value){
          value = value!;
        },
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


