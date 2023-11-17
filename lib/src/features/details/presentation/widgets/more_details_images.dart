import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gallery_image_viewer/gallery_image_viewer.dart';
import 'package:roome/src/core/models/hotel.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/details/presentation/widgets/more_image_item.dart';

class MoreDetailsImages extends StatelessWidget {
  const MoreDetailsImages({
    super.key,
    required this.image,
    required this.hotel,
    required this.index,
    required this.lastIndex,
    required this.imagesNumber,
  });

  final String image;
  final int index;
  final int lastIndex;
  final int imagesNumber;
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showHotelImages(context),
      child: index == lastIndex && imagesNumber >= 3
          ? FadeInRight(
              from: AppConstants.fadeInHorizontalValue,
              child: Stack(
                children: <Widget>[
                  MoreImageItem(image: image),
                  Container(
                    height: 64,
                    width: 64,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        '${hotel.images!.length - imagesNumber}+',
                        style: AppTextStyles.snackBarTitle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : FadeInRight(
              from: AppConstants.fadeInHorizontalValue,
              child: MoreImageItem(image: image),
            ),
    );
  }

  void _showHotelImages(BuildContext context) {
    if (index == lastIndex) {
      MultiImageProvider multiImageProvider = MultiImageProvider(
        List.generate(
          imagesNumber >= 3 ? _withoutFirstThree() : imagesNumber,
          (index) => Image.network(hotel.images![index].path!).image,
          growable: false,
        ),
      );

      showImageViewerPager(
        context,
        multiImageProvider,
        backgroundColor: Colors.transparent,
        useSafeArea: true,
        immersive: false,
      );
    }
  }

  int _withoutFirstThree() {
    List<HotelImage> hotelImages = hotel.images!;
    hotelImages.removeRange(0, 3);

    return hotelImages.length;
  }
}
