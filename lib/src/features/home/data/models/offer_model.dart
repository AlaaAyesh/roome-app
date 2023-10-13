import 'package:equatable/equatable.dart';

class OfferModel extends Equatable {
  final String imageUrl;
  final String offer;

  const OfferModel({
    required this.imageUrl,
    required this.offer,
  });

  @override
  List<Object?> get props => [imageUrl, offer];
}

const List<OfferModel> offers = <OfferModel>[
  OfferModel(
    imageUrl:
        'https://assets-global.website-files.com/5c6d6c45eaa55f57c6367749/65045f093c166fdddb4a94a5_x-65045f0266217.webp',
    offer: '10%',
  ),
  OfferModel(
    imageUrl:
        'https://viatravelers.com/wp-content/uploads/2021/01/Triple-Room.jpeg.webp',
    offer: '25%',
  ),
  OfferModel(
    imageUrl:
        'https://prod.butlins-prod.magnolia-platform.com/.imaging/focalpoint/landscape21-9/1600x/dam/jcr:fa02e512-8b52-4fa1-9a8c-d56bbbce3d05/Family-Images/Accommodation/Bognor-Regis/Wave-Hotel-Apartments/Wave-Hotel-Apartments/21785.jpg',
    offer: '15%',
  ),
];
