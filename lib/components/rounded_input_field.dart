import 'package:flutter/material.dart';
import 'package:healme/components/text_field_container.dart';
import 'package:healme/constants.dart';

class RoundedInputField extends StatelessWidget {
  final Function validate;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.validate,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validate,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: kPrimaryColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
