import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/booking/data/models/booked_hotel_info.dart';
import 'package:roome/src/features/booking/presentation/widgets/date_form.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_colors.dart';

class BookingOneBodyContent extends StatefulWidget {
  const BookingOneBodyContent({super.key, required this.bookedHotelInfo});

  final BookedHotelInfo bookedHotelInfo;

  @override
  State<BookingOneBodyContent> createState() => _BookingOneBodyContentState();
}

class _BookingOneBodyContentState extends State<BookingOneBodyContent> {
  final DateRangePickerController _dateRangePickerController =
      DateRangePickerController();

  String _checkInDate = '';
  String _checkOutDate = '';

  DateTime? startDate;
  DateTime? endDate;

  late PickerDateRange selectedRange;

  @override
  void initState() {
    selectedRange = PickerDateRange(startDate, endDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: SizeConfig.screenHeight! * 0.4,
          width: SizeConfig.screenWidth!,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.15),
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          child: SfDateRangePicker(
            controller: _dateRangePickerController,
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            selectionShape: DateRangePickerSelectionShape.circle,
            minDate: DateTime.now(),
            headerHeight: 50.h,
            headerStyle: DateRangePickerHeaderStyle(
              textStyle: AppTextStyles.textStyle14Medium,
            ),
            rangeSelectionColor: AppColors.primaryColor.withOpacity(0.30),
            endRangeSelectionColor: AppColors.primaryColor.withOpacity(0.65),
            todayHighlightColor: AppColors.primaryColor.withOpacity(0.47),
            startRangeSelectionColor: AppColors.primaryColor.withOpacity(0.65),
            showNavigationArrow: true,
            showActionButtons: false,
            navigationDirection: DateRangePickerNavigationDirection.horizontal,
            navigationMode: DateRangePickerNavigationMode.snap,
            allowViewNavigation: true,
            onSelectionChanged: (args) {
              selectedRange = args.value;
              setState(() {
                _checkInDate = DateFormat.MMMd()
                    .format(selectedRange.startDate!)
                    .toString();

                if (selectedRange.endDate == null) {
                  endDate = selectedRange.startDate;

                  setState(() {
                    _checkOutDate = DateFormat.MMMd().format(endDate!);
                  });
                } else {
                  _checkOutDate = DateFormat.MMMd()
                      .format(selectedRange.endDate!)
                      .toString();
                }
              });
            },
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.023),
        DateForm(
          bookedHotelInfo: widget.bookedHotelInfo,
          checkInDate: _checkInDate,
          checkOutDate: _checkOutDate,
        ),
      ],
    );
  }
}
