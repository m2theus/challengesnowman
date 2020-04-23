import 'package:flutter/material.dart';

class InputDropdown extends StatelessWidget {
  InputDropdown(
      this.data, this.hintText, this.valor, this.validator, this.onChange);

  var data;
  var hintText;
  var valor;
  var validator;
  var onChange;

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: validator,
      builder: (FormFieldState state) {
        return Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: InputDecorator(
              decoration: InputDecoration(
                  errorText: state.errorText,
                  hintText: hintText,
                  labelText: hintText,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400], width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400], width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[400], width: 1.0))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: valor,
                  isDense: true,
                  onChanged: (newValue) {
                    onChange(newValue);
                  },
                  items:
                      (data != null ? data : []).map<DropdownMenuItem>((value) {
                    return DropdownMenuItem(
                        value: value,
                        child: Text(value.name,
                            style: TextStyle(color: Colors.black)));
                  }).toList(),
                ),
              ),
            ));
      },
    );
  }
}
