import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceSlider extends StatefulWidget {
  const PriceSlider({super.key});

  @override
  State<PriceSlider> createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  SfRangeValues _values = const SfRangeValues(2000, 25000);

  @override
  Widget build(BuildContext context) {
    return SfRangeSlider(
      min: 0,
      max: 50000,
      values: _values,
      interval: 250,
      stepSize: 250,
      stepDuration: const SliderStepDuration(seconds: 1),
      showLabels: false,
      enableTooltip: true,
      shouldAlwaysShowTooltip: true,
      enableIntervalSelection: false,
      dragMode: SliderDragMode.both,
      showDividers: false,
      inactiveColor: AppColors.darkGrey.withOpacity(0.33),
      activeColor: AppColors.primaryColor,
      edgeLabelPlacement: EdgeLabelPlacement.auto,
      tooltipShape: const SfRectangularTooltipShape(),
      onChanged: (SfRangeValues newValues) {
        setState(() {
          _values = newValues;
        });
      },
    );
  }
}
