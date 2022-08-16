import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../constant/Themes.dart';
import '../constant/style.dart';


Widget SharedFromTextField({
  Function()? onTapFunction,
  String? Function(String? value)? onTapValidator,
  Function(String)? onChanged,
  Function()? onTapsuffixIcon,
  Function? validator,
  TextEditingController? Controller,
  int? maxLines,
  TextInputType? keyboardType,
  IconData? prefixIcon,
  IconData? suffixIcon,
  String? labelText,
  String? hintText,
  double? height,
  TextAlign textAlign = TextAlign.start,
  bool isPassword = false,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        height: height,
        child: TextFormField(
          onChanged: onChanged,
          onTap: onTapFunction,
          controller: Controller,
          maxLines: maxLines,
          minLines: 1,
          textInputAction: TextInputAction.next,
          style: TextStyle(fontSize: 19, color: Themes.ColorApp8),
          textAlign: textAlign,
          validator: onTapValidator,
          obscureText: isPassword,
          keyboardType: keyboardType,
          maxLength: 1,
          decoration: InputDecoration(
              hoverColor: Themes.ColorApp4,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Themes.ColorApp12,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Themes.ColorApp12,
                  width: 1.0,
                ),
              ),
              errorBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
              ),
              hintText: hintText,
              errorStyle: TextStyle(color: Colors.white),
              labelText: labelText),
        ),
      ),
    );


class FromTextShared extends StatelessWidget {
  Function()? onTapFunction;
  String? Function(String? value)? onTapValidator;
  Function(String)? onChanged;
  Function(String?)? onSaved;
  Function()? onTapsuffixIcon;
  Function? validator;
  TextEditingController? Controller;
  int? maxLines;
  int? maxLength;
  double? width;
  double? height;
  TextInputType? keyboardType;
  IconData? suffixIcon;
  FocusNode? focusNode;
  String? labelText;
  String? hintText;
  String? namePath;
  TextAlign? textAlign = TextAlign.start;

  FromTextShared(
      { this.onTapFunction,
        this.onTapValidator,
        this.onChanged,
        this.onTapsuffixIcon,
        this.onSaved,
        this.validator,
        required this.Controller,
        this.maxLines,
        this.maxLength,
        this.focusNode,
        this.namePath,
        this.width,
        this.height,
        required this.keyboardType,
        this.suffixIcon,
        required this.labelText,
        required this.hintText,
        this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        onTap: onTapFunction,
        focusNode: focusNode,
        controller: Controller,
        maxLines: maxLines,
        minLines: 1,
        maxLength: maxLength,
        style: const TextStyle(fontSize: 15, color: Themes.ColorApp8),
        validator: onTapValidator,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Image.asset(namePath!,width: width,height: height,),
            suffixIcon: suffixIcon != null
                ? IconButton(
              icon: Icon(suffixIcon),
              color: Themes.ColorApp1,
              onPressed: onTapsuffixIcon,
            )
                : null,
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Themes.ColorApp9, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Themes.ColorApp2, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Themes.ColorApp2, width: 1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Themes.ColorApp2, width: 1)),
            labelText: labelText),
      ),
    );
  }
}

class FromTextShared2 extends StatelessWidget {
  Function()? onTapFunction;
  String? Function(String? value)? onTapValidator;
  Function(String)? onChanged;
  Function(String?)? onSaved;
  Function()? onTapsuffixIcon;
  Function? validator;
  TextEditingController? Controller;
  int? maxLines;
  int? maxLength;
  double? width;
  double? height;
  TextInputType? keyboardType;
  IconData? suffixIcon;
  FocusNode? focusNode;
  String? labelText;
  String? hintText;
  TextAlign? textAlign = TextAlign.start;

  FromTextShared2(
      { this.onTapFunction,
       this.onTapValidator,
       this.onChanged,
      this.onTapsuffixIcon,
      this.onSaved,
       this.validator,
      required this.Controller,
       this.maxLines,
       this.maxLength,
        this.focusNode,
        this.width,
        this.height,
      required this.keyboardType,
      this.suffixIcon,
      required this.labelText,
      required this.hintText,
       this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        onTap: onTapFunction,
        focusNode: focusNode,
        controller: Controller,
        maxLines: maxLines,
        minLines: 1,
        maxLength: maxLength,
        style: const TextStyle(fontSize: 15, color: Themes.ColorApp8),
        validator: onTapValidator,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Themes.ColorApp9, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Themes.ColorApp2, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Themes.ColorApp2, width: 1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Themes.ColorApp2, width: 1)),
            labelText: labelText),
      ),
    );
  }
}

class FromTextRegisterShared extends StatelessWidget {
  Function()? onTapFunction;
  String? Function(String? value)? onTapValidator;
  Function(String)? onChanged;
  Function()? onTapsuffixIcon;
  Function? validator;
  TextEditingController? Controller;
  int? maxLines;
  int? maxLength;
  double? width;
  double? height;
  TextInputType? keyboardType;
  IconData? suffixIcon;
  bool? readOnly = false;
  FocusNode? focusNode;
  String? labelText;
  String? hintText;
  TextAlign? textAlign = TextAlign.start;
  bool? isPassword = false;

  FromTextRegisterShared(
      { this.onTapFunction,
        this.onTapValidator,
        this.onChanged,
        this.onTapsuffixIcon,
        this.validator,
        required this.Controller,
        this.maxLines,
        this.maxLength,
        this.focusNode,
        this.readOnly,
        this.width,
        this.height,
        required this.keyboardType,
        this.suffixIcon,
         this.labelText,
         this.hintText,
        this.textAlign,
        this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        onChanged: onChanged,
        onTap: onTapFunction,
        focusNode: focusNode,
        controller: Controller,
        maxLines: maxLines,
        minLines: 1,
        textInputAction: TextInputAction.next,
        readOnly: readOnly!,
        maxLength: maxLength,
        style: TextStyle(fontSize: 15, color: Themes.ColorApp8),
        validator: onTapValidator,
        obscureText: isPassword!,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            suffixIcon: suffixIcon != null
                ? IconButton(
              icon: Icon(suffixIcon),
              color: Themes.ColorApp1,
              onPressed: onTapsuffixIcon,
            )
                : null,
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Themes.ColorApp9, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Themes.ColorApp2, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Themes.ColorApp2, width: 1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Themes.ColorApp2, width: 1)),
            labelText: labelText),
      ),
    );
  }
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function()? press;

  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? 'don`t have account' : 'already have Account',
          style: TextStyle(color: primaryColor, fontSize: 15),
        ),
        SizedBox(
          width: 7,
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? 'sign up' : 'sign in',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        )
      ],
    );
  }
}

