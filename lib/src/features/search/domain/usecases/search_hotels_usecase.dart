import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/hotel.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/search/domain/repositories/search_repo.dart';

class SearchHotelsUseCase implements BaseUseCases<List<Hotel>, String> {
  final SearchRepo searchRepo;

  const SearchHotelsUseCase({required this.searchRepo});

  @override
  Future<Either<Failure, List<Hotel>>> call(String params) async {
    return await searchRepo.searchHotels(hotelName: params);
  }
}
