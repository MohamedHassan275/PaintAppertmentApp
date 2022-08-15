
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../componant/CustomTextFieldWidget.dart';

class TextFieldActivateCode extends StatelessWidget {
  Function(String)? onChanged;
  TextEditingController controller = TextEditingController();
  TextFieldActivateCode({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 100,
        child: SharedFromTextField(
            textAlign: TextAlign.center,
            hintText: 'ـــــ',
            onChanged: onChanged,
            onTapValidator: (value) {
              if (value!.isEmpty) {
                return 'must_not_empty'.tr;
              }
              return null;
            },
            keyboardType: TextInputType.number,
            maxLines: 1,
            Controller: controller),
      ),
    );
  }

}
