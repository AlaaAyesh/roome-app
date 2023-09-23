import 'package:roome/src/features/on_boarding/domain/entities/on_boarding_entity.dart';

class OnBoardingModel extends OnBoardingEntity {
  const OnBoardingModel({
    required String image,
    required String heading,
    required String subHeading,
  }) : super(
          image: image,
          heading: heading,
          subHeading: subHeading,
        );
}
