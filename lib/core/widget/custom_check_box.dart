import 'package:flutter/material.dart';

import '../global/app_assets.dart';
class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({Key? key}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            isChecked = !isChecked;
          });
        },
        child: Container(
          width: 16.8,
          height: 14.0,
          decoration:  BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: kPrimaryColor)
          ),
          child: isChecked
              ?  const SizedBox(
            width: 12,height: 10,
            child: Icon(
              Icons.check,
              color: kPrimaryColor,
              size: 12,
            ),
          )
              : null,
        ),
      ),
    );
  }
}
