import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/booking/presentation/widgets/custom_bordered_container.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String _selectedRoomType = 'Double';

  final List<String> _roomTypes = <String>['Double', 'Single'];

  @override
  Widget build(BuildContext context) {
    return CustomBorderedContainer(
      padding: EdgeInsets.only(left: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            _selectedRoomType,
            style: AppTextStyles.textStyle14Medium.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor.withOpacity(0.94),
            ),
          ),
          DropdownButton(
            // dropdownColor: AppColors.primaryColor.withOpacity(0.04),

            borderRadius: BorderRadius.circular(10.r),
            items: _roomTypes.map<DropdownMenuItem<String>>((String type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(
                  type,
                  style: AppTextStyles.textStyle14Medium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor.withOpacity(0.94),
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newVal) {
              setState(() {
                _selectedRoomType = newVal!;
              });
            },
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black.withOpacity(0.62),
            ),
            elevation: 4.w.toInt(),
            underline: Container(height: 0),
          ),
        ],
      ),
    );
  }
}
