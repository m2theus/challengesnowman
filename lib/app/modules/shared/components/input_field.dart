import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField(this.validator, this.hintText,
      {this.decoration = null,
      this.obscureText = false,
      this.controller,
      this.typePassword = false,
      this.onTap,
      this.isColorInput = false,
      this.colorInputCircle});

  var controller;
  var validator;
  var hintText;
  var decoration;
  var obscureText;
  var typePassword;
  var onTap;
  var isColorInput;
  var colorInputCircle;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: TextFormField(
            onTap: onTap,
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            decoration: decoration != null
                ? decoration
                : InputDecoration(
                    suffixIcon: isColorInput
                        ? Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorInputCircle),
                            width: 5,
                            height: 5,
                            margin: EdgeInsets.only(
                              top: 6,
                              bottom: 6,
                            ),
                          )
                        : null,
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.grey[400]),
                    hintText: hintText,
                    labelText: hintText,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[400], width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[400], width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[400], width: 1.0)),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                    ),
                  )));
  }
}
