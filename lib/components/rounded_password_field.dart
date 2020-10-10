import 'package:flutter/material.dart';
import 'package:healme/components/text_field_container.dart';
import 'package:healme/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final Function validate;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.validate,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validate,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: kPrimaryColor),
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
//          suffixIcon: Icon(
//            Icons.visibility,
//            color: kPrimaryColor,
//          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
