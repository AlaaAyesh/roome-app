import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/booking/data/models/booked_hotel_info.dart';
import 'package:roome/src/features/booking/presentation/widgets/date_form.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
        FadeInLeft(
          from: AppConstants.fadeInHorizontalValue,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.15),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SfDateRangePicker(
              controller: _dateRangePickerController,
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.range,
              selectionShape: DateRangePickerSelectionShape.circle,
              minDate: DateTime.now(),
              headerHeight: 50,
              headerStyle: DateRangePickerHeaderStyle(
                textStyle: AppTextStyles.textStyle14Medium,
              ),
              rangeSelectionColor: AppColors.primaryColor.withOpacity(0.30),
              endRangeSelectionColor: AppColors.primaryColor.withOpacity(0.65),
              todayHighlightColor: AppColors.primaryColor.withOpacity(0.47),
              startRangeSelectionColor:
                  AppColors.primaryColor.withOpacity(0.65),
              showNavigationArrow: true,
              showActionButtons: false,
              navigationDirection:
                  DateRangePickerNavigationDirection.horizontal,
              navigationMode: DateRangePickerNavigationMode.snap,
              allowViewNavigation: true,
              onSelectionChanged: (args) {
                selectedRange = args.value;
                setState(() {
                  _checkInDate =
                      DateFormat.MMMd().format(selectedRange.startDate!);

                  if (selectedRange.endDate == null) {
                    endDate = selectedRange.startDate;

                    setState(() {
                      _checkOutDate = DateFormat.MMMd().format(endDate!);
                    });
                  } else {
                    _checkOutDate =
                        DateFormat.MMMd().format(selectedRange.endDate!);
                  }
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 23),
        FadeInUp(
          from: AppConstants.fadeInUpValue,
          child: DateForm(
            bookedHotelInfo: widget.bookedHotelInfo,
            checkInDate: _checkInDate,
            checkOutDate: _checkOutDate,
          ),
        ),
      ],
    );
  }
}
